CREATE TABLE IF NOT EXISTS DM_Time (
    `Date` TIMESTAMP,
    DayNumberofMonth INTEGER,
    MonthNumberofYear INTEGER,
    CalendarYear INTEGER,
    CONSTRAINT PK_Time PRIMARY KEY (`Date`)
);