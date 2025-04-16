import pyodbc

# Connect to SQL Server
conn = pyodbc.connect('DRIVER={SQL Server};SERVER=Win234;DATABASE=class2;UID=user4;PWD=password')
cursor = conn.cursor()

# Query to retrieve the image
cursor.execute("SELECT photo_data FROM photos WHERE id = 1")
image_data = cursor.fetchone()[0]

# Write the image data to a file
with open("retrieved_image.jpg", "wb") as file:
    file.write(image_data)

print("Image retrieved and saved successfully.")

# Close the connection
conn.close()

