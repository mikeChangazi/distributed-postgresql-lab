import psycopg

from config import (
    DB_HOST,
    DB_PORT,
    DB_NAME,
    DB_USER,
    DB_PASSWORD,
)


def test_connection():
    connection = psycopg.connect(
        host=DB_HOST,
        port=DB_PORT,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
    )

    try:
        with connection.cursor() as cursor:
            cursor.execute(
                "SELECT current_database(), current_user;"
            )

            database, user = cursor.fetchone()

            print("PostgreSQL connection successful")
            print(f"Database: {database}")
            print(f"User: {user}")

    finally:
        connection.close()
        print("Connection closed")


if __name__ == "__main__":
    test_connection()
