package GU.data;

import GU.business.StudySuspension;

public class StudySuspensionIO {
    public static void setStudySuspensionInfoDB(StudySuspension studySuspension)
     {
         String query="insert into study_suspension values ('"+ studySuspension.getId() + "', '" +
                 studySuspension.getSuspensionreason() + "', '" +studySuspension.getEvidence() + "', '" +
                 studySuspension.getDate() + "')";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated>0){
            System.out.println("sucessful");
            ProgressTrackerIO.setRegistration(studySuspension.getId(), "Suspend", studySuspension.getDate());
            ProgressTrackerIO.updateTaskDB(studySuspension.getId(), 1, true);
            ProgressTrackerIO.updateProgressDB(studySuspension.getId(), 10);
        }
        else System.out.println("unsucessful");
     }
}
