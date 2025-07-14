# Database Coursework

This project was created as a course work on databases, the goal was to design and populate the database, as well as develop a program interface. PHP was chosen to implement the UI because of its ease of deployment and use.

The user of this web application can use the following functions:
- Register for sports sections
- Edit your profile
- View the sections to which he is enrolled
- View which days there are trainings
- Leave sections
  
In order to install the application, you first need to copy the repository:
```
git clone https://github.com/Cypher64/SportSectionSite.git
cd ./SportSectionSite
```
After that, you need to import the database into mysql (if you don't have mysql, you need to install or run it in a docker container):
```
mysql -u user -p SportSectionsDB < ./sections.sql
```
In order to host the site you will need something like openserver panel, or some extension with vs code (personally I used osp)

## Screenshots of program works
- Home page
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/ae7f998b-c3ca-492a-86f2-dc7193815c87" />

- Section page
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/390a52ca-733a-459e-98c3-babfc0e31c17" />

- User profile page
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/265c1a79-2eeb-4060-94bd-897a55fe9f57" />

- My sections tab
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/bc333719-27d2-492d-896f-d162ef32cab8" />

- Calendar of training
<img width="300" height="300" alt="image" src="https://github.com/user-attachments/assets/82573d95-221b-4447-b5cc-46319059cb26" />
