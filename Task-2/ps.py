import faker

fake = faker.Faker()

# Generate SQL for 100 customers
for _ in range(100):
    customer = (
        fake.email(),  # Unique email
        fake.name(),   # Name
        fake.address().replace("\n", ", "),  # Address (replace newlines with commas)
        fake.phone_number()  # Phone number
    )
    print(f"INSERT INTO Customer(email, name, address, phone) VALUES {customer};")

