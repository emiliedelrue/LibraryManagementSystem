#!/usr/bin/env python3

class Book:
	def __init__(self, title: str, author: str):
		self.title = title
		self.author = author
		self.is_available = True
		
	def __str__(self):
		return f"'{self.title}' by {self.author}, Available: {self.is_available}"
	
class Student:
	def __init__(self, name: str, max_borrow_limit: int = 3):
		self.name = name
		self.borrowed_books = []
		self.max_borrow_limit = max_borrow_limit
		
	def borrow_book(self, book_title: str, library: 'Library'):
		if len(self.borrowed_books) >= self.max_borrow_limit:
				print("Too much books borrwed")
				return False 
		for book in library.books:
			if book.title == book_title and book.is_available:
				book.is_available = False
				self.borrowed_books.append(book) 
				print("Ok borrowed.")
				return
		print(f"Sorry, '{book_title}' is not available")
		
	def return_book(self, book_title: str, library: 'Library'):
		for book in self.borrowed_books:
			if book.title == book_title:
				book.is_available = True  
				self.borrowed_books.remove(book)
				library.add_book(book.title, book.author)
				print("OK returned")
				return
		print(f"{self.name} has not a book called '{book_title}'")


class Library:
	def __init__(self):
		self.books = []
		
	def add_book(self, title: str, author: str):
		book = Book(title, author) 
		self.books.append(book) 
	
	def list_books(self):
		return [str(book) for book in self.books]
	
	def load_books(self, file_path: str):
		try :
			with open(file_path, "r") as fichier:
				for line in fichier:
					line = line.strip()  
					if line:  
						try:
							title, author = line.split(',', 1)  
							self.add_book(title.strip(), author.strip())  
						except ValueError:
							print(f"Skipping invalid line: {line}")
		except FileNotFoundError:
			print(f"File {file_path} not found.")
		except Exception as e:
			print(f"An error occurred: {e}")
		
		
	def lend_book(self, book_title: str, student: Student):
		for borrowed_book in student.borrowed_books:
			if borrowed_book.title == book_title:
				print(f"already borrowed '{book_title}'.")
				return False 
			
		for book in self.books:
			if book.title == book_title and book.is_available:
				book.is_available = False
				student.borrowed_books.append(book)
				print("Ok lended")
				return True
			print(f"Sorry, '{book_title}' is not available.")
			return False
		
	def accept_return(self, book_title: str, student: Student):
		for book in student.borrowed_books:
			if book.title == book_title:
				book.is_available = True
				student.borrowed_books.remove(book)
				print("Ok returned")
				return
		print(f"{student.name} has not a book called '{book_title}'")
		
		
	def search_books(self, query: str):
		matching_books = []
		for book in self.books:
			if query.lower() in book.title.lower() or query.lower() in book.author.lower():
				matching_books.append(str(book))
		return matching_books

	def save_books(self, file_path: str):
		try:
			with open(file_path, 'w+') as fichier:
				for book in self.books:
					fichier.write(f"{book.title},{book.author},{book.is_available}\n")
			print(f"Library saved to {file_path}.")
		except Exception as e:
			print(f"An error occurred while saving the library: {e}")
					
			

def run_library_system():
		library = Library()
		student1 = Student("Camille")
		while True:
			print("\n--- Library System ---")
			print("1. View all books")
			print("2. Search for a book")
			print("3. Add a new book")
			print("4. Borrow a book")
			print("5. Return a book")
			print("6. Exit")
			
			choice = input("Please enter the number of your choice: ").strip()
			
			if choice == '1':
				print("\n--- All Books ---")
				print(library.list_books())
					
			elif choice == '2':
				query = input("\nTitle or author to search: ").strip()
				search_results = library.search_books(query)
				for book in search_results:
					print(book)
					
					
			elif choice == '3':
				title = input("\nTitle : ").strip()
				author = input("Author : ").strip()
				library.add_book(title, author)
				print("Ok")
				
			elif choice == '4':
				title = input("\nTitle of the book to borrow: ").strip()
				success = library.lend_book(title, student1)
					
			elif choice == '5':
				title = input("\nTitle of the book to return: ").strip()
				library.accept_return(title, student1)
				
			elif choice == '6':
				print("Exit the program")
				break
		
			else:
				print("Invalid choice. Please enter a number between 1 and 6.")
						


		
#TEST
library = Library()
library.add_book("1984", "George Orwell")
library.add_book("Brave New World", "Aldous Huxley")
library.add_book("Fahrenheit 451", "Ray Bradbury")
library.add_book("The Great Gatsby", "F. Scott Fitzgerald")

student1 = Student("Camille")
student2 = Student("Priya")
library.lend_book("1984", student1)
student2.borrow_book("1984", library)
student2.borrow_book("Fahrenheit 451", library)
student2.return_book("Fahrenheit 451", library)
library.accept_return("Fahrenheit 451", student1)
print("Student's Borrowed Books:", student1.__str__())
print("Library Books:", library.list_books())

print("Search results for 'George':")
search_results = library.search_books("George")
for book in search_results:
	print(book)

	
print("\nSearch results for 'world':")
search_results = library.search_books("world")
for book in search_results:
	print(book)


run_library_system()
		