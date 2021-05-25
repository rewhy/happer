.class public Lcom/markuspage/android/atimetracker/Tasks;
.super Landroid/app/ListActivity;
.source "Tasks.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;,
        Lcom/markuspage/android/atimetracker/Tasks$TaskView;
    }
.end annotation


# static fields
.field protected static final ADD_TASK:I = 0x0

.field protected static final BACKUP:I = 0xe

.field protected static final CHANGE_VIEW:I = 0x5

.field protected static final CONCURRENT:Ljava/lang/String; = "concurrent-tasks"

.field private static final DECIMAL_FORMAT:Ljava/lang/String; = "%02d.%02d"

.field protected static final DELETE_TASK:I = 0x2

.field private static final D_M:D = 1.6666666666666667

.field private static final D_S:D = 0.027777777777777776

.field protected static final EDIT_TASK:I = 0x1

.field protected static final END_DATE:Ljava/lang/String; = "end_date"

.field protected static final ERROR_DIALOG:I = 0xb

.field protected static final EXPORT_VIEW:I = 0x9

.field protected static final FONTSIZE:Ljava/lang/String; = "font-size"

.field private static final FORMAT:Ljava/lang/String; = "%02d:%02d"

.field protected static final HELP:I = 0x8

.field protected static final MILITARY:Ljava/lang/String; = "military-time"

.field protected static final MORE:I = 0xd

.field private static final MS_H:J = 0x36ee80L

.field private static final MS_M:J = 0xea60L

.field private static final MS_S:J = 0x3e8L

.field protected static final PREFERENCES:I = 0xf

.field protected static final PROGRESS_DIALOG:I = 0x10

.field private static final REFRESH_MS:I = 0xea60

.field protected static final REPORT:I = 0x3

.field protected static final REPORT_DATE:Ljava/lang/String; = "report_date"

.field protected static final ROUND_REPORT_TIMES:Ljava/lang/String; = "round_report_times"

.field static final SDCARD:Ljava/lang/String; = "/sdcard/"

.field protected static final SELECT_END_DATE:I = 0x7

.field protected static final SELECT_START_DATE:I = 0x6

.field protected static final SET_WEEK_START_DAY:I = 0xc

.field protected static final SHOW_TIMES:I = 0x4

.field protected static final SOUND:Ljava/lang/String; = "sound-enabled"

.field protected static final START_DATE:Ljava/lang/String; = "start_date"

.field protected static final START_DAY:Ljava/lang/String; = "start_day"

.field protected static final SUCCESS_DIALOG:I = 0xa

.field protected static final TIMEDISPLAY:Ljava/lang/String; = "time_display"

.field public static final TIMETRACKERPREF:Ljava/lang/String; = "timetracker.pref"

.field protected static final VIBRATE:Ljava/lang/String; = "vibrate-enabled"

.field protected static final VIEW_MODE:Ljava/lang/String; = "view_mode"

.field private static clickPlayer:Landroid/media/MediaPlayer; = null

.field private static final dbPath:Ljava/lang/String; = "/data/data/com.markuspage.android.atimetracker/databases/timetracker.db"

.field private static fontSize:I = 0x10


# instance fields
.field private adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

.field private baseTitle:Ljava/lang/String;

.field private concurrency:Z

.field private final dbBackup:Ljava/io/File;

.field private decimalFormat:Z

.field private exportMessage:Ljava/lang/String;

.field private operationFailed:Landroid/app/AlertDialog;

.field private operationSucceed:Landroid/app/AlertDialog;

.field private playClick:Z

.field private preferences:Landroid/content/SharedPreferences;

.field private progressDialog:Landroid/app/ProgressDialog;

.field private running:Z

.field private selectedTask:Lcom/markuspage/android/atimetracker/Task;

.field private timer:Landroid/os/Handler;

.field private updater:Ljava/util/TimerTask;

.field private vibrateAgent:Landroid/os/Vibrator;

.field private vibrateClick:Z


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    iput-boolean v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->playClick:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->vibrateClick:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->progressDialog:Landroid/app/ProgressDialog;

    iput-boolean v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->decimalFormat:Z

    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "timetracker.db"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->dbBackup:Ljava/io/File;

    return-void
.end method

.method static synthetic access$000(Lcom/markuspage/android/atimetracker/Tasks;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    return p0
.end method

.method static synthetic access$002(Lcom/markuspage/android/atimetracker/Tasks;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    return p1
.end method

.method static synthetic access$100(Lcom/markuspage/android/atimetracker/Tasks;)Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;
    .registers 1

    iget-object p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/markuspage/android/atimetracker/Tasks;)Landroid/content/SharedPreferences;
    .registers 1

    iget-object p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/markuspage/android/atimetracker/Tasks;I)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->switchView(I)V

    return-void
.end method

.method static synthetic access$1300(Lcom/markuspage/android/atimetracker/Tasks;)Lcom/markuspage/android/atimetracker/Task;
    .registers 1

    iget-object p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->selectedTask:Lcom/markuspage/android/atimetracker/Task;

    return-object p0
.end method

.method static synthetic access$1400()I
    .registers 1

    sget v0, Lcom/markuspage/android/atimetracker/Tasks;->fontSize:I

    return v0
.end method

.method static synthetic access$1500(Lcom/markuspage/android/atimetracker/Tasks;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->decimalFormat:Z

    return p0
.end method

.method static synthetic access$200(Lcom/markuspage/android/atimetracker/Tasks;)V
    .registers 1

    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->setTitle()V

    return-void
.end method

.method static synthetic access$300(Lcom/markuspage/android/atimetracker/Tasks;)Landroid/os/Handler;
    .registers 1

    iget-object p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$600(Lcom/markuspage/android/atimetracker/Tasks;)Ljava/lang/String;
    .registers 1

    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->export()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lcom/markuspage/android/atimetracker/Tasks;)Ljava/io/File;
    .registers 1

    iget-object p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->dbBackup:Ljava/io/File;

    return-object p0
.end method

.method static synthetic access$800(Lcom/markuspage/android/atimetracker/Tasks;)Landroid/app/ProgressDialog;
    .registers 1

    iget-object p0, p0, Lcom/markuspage/android/atimetracker/Tasks;->progressDialog:Landroid/app/ProgressDialog;

    return-object p0
.end method

.method static synthetic access$902(Lcom/markuspage/android/atimetracker/Tasks;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->exportMessage:Ljava/lang/String;

    return-object p1
.end method

.method private export()Ljava/lang/String;
    .registers 7

    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getRangeName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".csv"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/sdcard/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    :goto_2c
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_64

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ".csv"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/sdcard/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2c

    :cond_64
    :try_start_64
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {v2}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->getCurrentRange()Landroid/database/Cursor;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/markuspage/android/atimetracker/CSVExporter;->exportRows(Ljava/io/OutputStream;Landroid/database/Cursor;)V

    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_75
    .catch Ljava/io/FileNotFoundException; {:try_start_64 .. :try_end_75} :catch_76

    return-object v1

    :catch_76
    move-exception v0

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/io/FileNotFoundException;->printStackTrace(Ljava/io/PrintStream;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method static formatTotal(ZJJ)Ljava/lang/String;
    .registers 11

    const-string v1, "%02d:%02d"

    move v0, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lcom/markuspage/android/atimetracker/Tasks;->formatTotal(ZLjava/lang/String;JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static formatTotal(ZJJJJ)Ljava/lang/String;
    .registers 19

    const-string v1, "%02d:%02d"

    move v0, p0

    move-wide v2, p1

    move-wide v4, p3

    move-wide v6, p5

    move-wide/from16 v8, p7

    invoke-static/range {v0 .. v9}, Lcom/markuspage/android/atimetracker/Tasks;->formatTotal(ZLjava/lang/String;JJJJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static formatTotal(ZLjava/lang/String;JJ)Ljava/lang/String;
    .registers 18

    move-wide/from16 v8, p4

    const-wide/32 v0, 0xea60

    const-wide/16 v2, 0x0

    cmp-long v4, v8, v2

    if-lez v4, :cond_1a

    div-long v2, p2, v0

    long-to-float v2, v2

    long-to-float v3, v8

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-long v2, v2

    mul-long v2, v2, v8

    mul-long v2, v2, v0

    goto :goto_1b

    :cond_1a
    move-wide v2, p2

    :goto_1b
    const-wide/32 v4, 0x36ee80

    div-long v6, v2, v4

    mul-long v4, v4, v6

    sub-long/2addr v2, v4

    div-long v4, v2, v0

    mul-long v0, v0, v4

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x3e8

    div-long v10, v2, v0

    move v0, p0

    move-object v1, p1

    move-wide v2, v6

    move-wide v6, v10

    move-wide/from16 v8, p4

    invoke-static/range {v0 .. v9}, Lcom/markuspage/android/atimetracker/Tasks;->formatTotal(ZLjava/lang/String;JJJJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static formatTotal(ZLjava/lang/String;JJJJ)Ljava/lang/String;
    .registers 10

    if-eqz p0, :cond_21

    const-string p1, "%02d.%02d"

    const-wide p8, 0x3ffaaaaaaaaaaaabL    # 1.6666666666666667

    long-to-double p4, p4

    invoke-static {p4, p5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p4, p4, p8

    const-wide p8, 0x3f9c71c71c71c71cL    # 0.027777777777777776

    long-to-double p6, p6

    invoke-static {p6, p7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p6, p6, p8

    add-double/2addr p4, p6

    invoke-static {p4, p5}, Ljava/lang/Math;->round(D)J

    move-result-wide p4

    const-wide/16 p6, 0x0

    :cond_21
    const/4 p0, 0x3

    new-array p0, p0, [Ljava/lang/Object;

    const/4 p8, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, p0, p8

    const/4 p2, 0x1

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    aput-object p3, p0, p2

    const/4 p2, 0x2

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    aput-object p3, p0, p2

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getRangeName()Ljava/lang/String;
    .registers 6

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J
    invoke-static {v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->access$400(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_f

    const-string v0, "all"

    return-object v0

    :cond_f
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J
    invoke-static {v2}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->access$400(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/Date;->setTime(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private openAboutDialog()Landroid/app/Dialog;
    .registers 5

    const-string v0, ""

    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v3, "com.markuspage.android.atimetracker"

    invoke-virtual {v2, v3, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_f} :catch_10

    move-object v0, v2

    :catch_10
    const v2, 0x7f0d006a

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v1

    invoke-virtual {p0, v2, v3}, Lcom/markuspage/android/atimetracker/Tasks;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0a001c

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f080098

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f080096

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/16 v2, 0xf

    invoke-static {v0, v2}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    const v0, 0x7f08002e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {v0, v2}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method private openChangeViewDialog()Landroid/app/Dialog;
    .registers 4

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/markuspage/android/atimetracker/Tasks$3;

    invoke-direct {v1, p0}, Lcom/markuspage/android/atimetracker/Tasks$3;-><init>(Lcom/markuspage/android/atimetracker/Tasks;)V

    const v2, 0x7f020003

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method private openDeleteTaskDialog()Landroid/app/Dialog;
    .registers 7

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->selectedTask:Lcom/markuspage/android/atimetracker/Task;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    :cond_6
    const v0, 0x7f0d0036

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/markuspage/android/atimetracker/Tasks;->selectedTask:Lcom/markuspage/android/atimetracker/Task;

    invoke-virtual {v5}, Lcom/markuspage/android/atimetracker/Task;->getTaskName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, v0, v3}, Lcom/markuspage/android/atimetracker/Tasks;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f0d0037

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x108008a

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x7f0d0034

    new-instance v3, Lcom/markuspage/android/atimetracker/Tasks$6;

    invoke-direct {v3, p0}, Lcom/markuspage/android/atimetracker/Tasks$6;-><init>(Lcom/markuspage/android/atimetracker/Tasks;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method private openEditTaskDialog()Landroid/app/Dialog;
    .registers 6

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->selectedTask:Lcom/markuspage/android/atimetracker/Task;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    :cond_6
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0a001e

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x104000a

    new-instance v4, Lcom/markuspage/android/atimetracker/Tasks$5;

    invoke-direct {v4, p0, v0}, Lcom/markuspage/android/atimetracker/Tasks$5;-><init>(Lcom/markuspage/android/atimetracker/Tasks;Landroid/view/View;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method private openNewTaskDialog()Landroid/app/Dialog;
    .registers 5

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0a001e

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0d0028

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/markuspage/android/atimetracker/Tasks$4;

    invoke-direct {v3, p0, v0}, Lcom/markuspage/android/atimetracker/Tasks$4;-><init>(Lcom/markuspage/android/atimetracker/Tasks;Landroid/view/View;)V

    const v0, 0x7f0d0027

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method private setTitle()V
    .registers 8

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    iget-object v0, v0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v1, 0x0

    move-wide v3, v1

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/markuspage/android/atimetracker/Task;

    invoke-virtual {v5}, Lcom/markuspage/android/atimetracker/Task;->getTotal()J

    move-result-wide v5

    add-long/2addr v3, v5

    goto :goto_b

    :cond_1d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/markuspage/android/atimetracker/Tasks;->baseTitle:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/markuspage/android/atimetracker/Tasks;->decimalFormat:Z

    invoke-static {v5, v3, v4, v1, v2}, Lcom/markuspage/android/atimetracker/Tasks;->formatTotal(ZJJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/markuspage/android/atimetracker/Tasks;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private switchView(I)V
    .registers 11

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v2, "start_day"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setFirstDayOfWeek(I)V

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020003

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, p1

    aput-object v5, v4, v3

    const v5, 0x7f0d0068

    invoke-virtual {p0, v5, v4}, Lcom/markuspage/android/atimetracker/Tasks;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    const/4 v7, -0x1

    packed-switch p1, :pswitch_data_fc

    goto/16 :goto_ef

    :pswitch_31
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "start_date"

    const-wide/16 v7, 0x0

    invoke-interface {v0, v1, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "START = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v4, "end_date"

    invoke-interface {v1, v4, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-virtual {v0, v7, v8}, Ljava/util/Calendar;->setTimeInMillis(J)V

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "END = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {v1, p1, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/util/Calendar;Ljava/util/Calendar;)V

    invoke-static {v6}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " - "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-virtual {p0, v5, v2}, Lcom/markuspage/android/atimetracker/Tasks;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_ef

    :pswitch_bb
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    # invokes: Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks()V
    invoke-static {p1}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->access$1200(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)V

    goto :goto_ef

    :pswitch_c1
    invoke-virtual {v0, v6, v7}, Ljava/util/Calendar;->add(II)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-static {v0, v1}, Lcom/markuspage/android/atimetracker/Report;->weekStart(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v2

    invoke-static {v0, v1}, Lcom/markuspage/android/atimetracker/Report;->weekEnd(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/util/Calendar;Ljava/util/Calendar;)V

    goto :goto_ef

    :pswitch_d2
    const/4 p1, 0x5

    invoke-virtual {v0, p1, v7}, Ljava/util/Calendar;->add(II)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {p1, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/util/Calendar;)V

    goto :goto_ef

    :pswitch_dc
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-static {v0, v1}, Lcom/markuspage/android/atimetracker/Report;->weekStart(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v2

    invoke-static {v0, v1}, Lcom/markuspage/android/atimetracker/Report;->weekEnd(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/util/Calendar;Ljava/util/Calendar;)V

    goto :goto_ef

    :pswitch_ea
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {p1, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/util/Calendar;)V

    :goto_ef
    iput-object v4, p0, Lcom/markuspage/android/atimetracker/Tasks;->baseTitle:Ljava/lang/String;

    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->setTitle()V

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getListView()Landroid/widget/ListView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ListView;->invalidate()V

    return-void

    :pswitch_data_fc
    .packed-switch 0x0
        :pswitch_ea
        :pswitch_dc
        :pswitch_d2
        :pswitch_c1
        :pswitch_bb
        :pswitch_31
    .end packed-switch
.end method


# virtual methods
.method protected finishedCopy(Lcom/markuspage/android/atimetracker/DBBackup$Result;Ljava/lang/String;II)V
    .registers 6

    sget-object v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;->SUCCESS:Lcom/markuspage/android/atimetracker/DBBackup$Result;

    if-ne p1, v0, :cond_16

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string p2, "view_mode"

    const/4 v0, 0x0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->switchView(I)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->dbBackup:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    :cond_16
    invoke-virtual {p0, p2, p3, p4}, Lcom/markuspage/android/atimetracker/Tasks;->perform(Ljava/lang/String;II)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 9

    const/16 p2, 0xf

    if-ne p1, p2, :cond_de

    if-eqz p3, :cond_de

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "start_day"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_1e

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v0, "view_mode"

    invoke-interface {p2, v0, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    invoke-direct {p0, p2}, Lcom/markuspage/android/atimetracker/Tasks;->switchView(I)V

    :cond_1e
    const-string p2, "military-time"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_44

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "military-time"

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_3b

    new-instance p2, Ljava/text/SimpleDateFormat;

    const-string v1, "HH:mm"

    invoke-direct {p2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object p2, Lcom/markuspage/android/atimetracker/TimeRange;->FORMAT:Ljava/text/DateFormat;

    goto :goto_44

    :cond_3b
    new-instance p2, Ljava/text/SimpleDateFormat;

    const-string v1, "hh:mm a"

    invoke-direct {p2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object p2, Lcom/markuspage/android/atimetracker/TimeRange;->FORMAT:Ljava/text/DateFormat;

    :cond_44
    :goto_44
    const-string p2, "concurrent-tasks"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_56

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "concurrent-tasks"

    invoke-interface {p2, v1, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->concurrency:Z

    :cond_56
    const-string p2, "sound-enabled"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_a6

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "sound-enabled"

    invoke-interface {p2, v1, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->playClick:Z

    iget-boolean p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->playClick:Z

    if-eqz p2, :cond_a6

    sget-object p2, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    if-nez p2, :cond_a6

    const/high16 p2, 0x7f0c0000

    invoke-static {p0, p2}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p2

    sput-object p2, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    :try_start_78
    sget-object p2, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p2}, Landroid/media/MediaPlayer;->prepareAsync()V

    sget-object p2, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p2, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V
    :try_end_84
    .catch Ljava/lang/IllegalStateException; {:try_start_78 .. :try_end_84} :catch_85

    goto :goto_a6

    :catch_85
    move-exception p2

    const-string v1, "TimeTracker"

    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to set up audio player: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v2, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    :cond_a6
    :goto_a6
    const-string p2, "vibrate-enabled"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_b8

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "vibrate-enabled"

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->vibrateClick:Z

    :cond_b8
    const-string p2, "font-size"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_cc

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v0, "font-size"

    const/16 v1, 0x10

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    sput p2, Lcom/markuspage/android/atimetracker/Tasks;->fontSize:I

    :cond_cc
    const-string p2, "time_display"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_de

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string p2, "time_display"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->decimalFormat:Z

    :cond_de
    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getListView()Landroid/widget/ListView;

    move-result-object p1

    if-eqz p1, :cond_eb

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getListView()Landroid/widget/ListView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ListView;->invalidate()V

    :cond_eb
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .registers 8

    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    iget-wide v2, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    long-to-int v0, v2

    invoke-virtual {v1, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/markuspage/android/atimetracker/Task;

    iput-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->selectedTask:Lcom/markuspage/android/atimetracker/Task;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_22

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/markuspage/android/atimetracker/Tasks;->showDialog(I)V

    goto :goto_59

    :cond_22
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/markuspage/android/atimetracker/TaskTimes;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "task_id"

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->selectedTask:Lcom/markuspage/android/atimetracker/Task;

    invoke-virtual {v2}, Lcom/markuspage/android/atimetracker/Task;->getId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J
    invoke-static {v1}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->access$400(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_56

    const-string v1, "start"

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J
    invoke-static {v2}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->access$400(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "end"

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeEnd:J
    invoke-static {v2}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->access$500(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    :cond_56
    invoke-virtual {p0, v0}, Lcom/markuspage/android/atimetracker/Tasks;->startActivity(Landroid/content/Intent;)V

    :goto_59
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "timetracker.pref"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/markuspage/android/atimetracker/Tasks;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "font-size"

    const/16 v2, 0x10

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    sput p1, Lcom/markuspage/android/atimetracker/Tasks;->fontSize:I

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "concurrent-tasks"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->concurrency:Z

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "military-time"

    const/4 v2, 0x1

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_37

    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string v1, "HH:mm"

    invoke-direct {p1, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object p1, Lcom/markuspage/android/atimetracker/TimeRange;->FORMAT:Ljava/text/DateFormat;

    goto :goto_40

    :cond_37
    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string v1, "hh:mm a"

    invoke-direct {p1, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object p1, Lcom/markuspage/android/atimetracker/TimeRange;->FORMAT:Ljava/text/DateFormat;

    :goto_40
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "view_mode"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    if-nez v1, :cond_5b

    new-instance v1, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-direct {v1, p0, p0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;-><init>(Lcom/markuspage/android/atimetracker/Tasks;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {p0, v1}, Lcom/markuspage/android/atimetracker/Tasks;->setListAdapter(Landroid/widget/ListAdapter;)V

    invoke-direct {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->switchView(I)V

    :cond_5b
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    if-nez p1, :cond_66

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    :cond_66
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    if-nez p1, :cond_71

    new-instance p1, Lcom/markuspage/android/atimetracker/Tasks$1;

    invoke-direct {p1, p0}, Lcom/markuspage/android/atimetracker/Tasks$1;-><init>(Lcom/markuspage/android/atimetracker/Tasks;)V

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    :cond_71
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "sound-enabled"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->playClick:Z

    iget-boolean p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->playClick:Z

    if-eqz p1, :cond_b2

    sget-object p1, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    if-nez p1, :cond_b2

    const/high16 p1, 0x7f0c0000

    invoke-static {p0, p1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    sput-object p1, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    :try_start_8b
    sget-object p1, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_90
    .catch Ljava/lang/IllegalStateException; {:try_start_8b .. :try_end_90} :catch_91

    goto :goto_b2

    :catch_91
    move-exception p1

    const-string v1, "TimeTracker"

    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to set up audio player: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v3, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    :cond_b2
    :goto_b2
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "time_display"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->decimalFormat:Z

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getListView()Landroid/widget/ListView;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->registerForContextMenu(Landroid/view/View;)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    iget-object p1, p1, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_d2

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->showDialog(I)V

    :cond_d2
    const-string p1, "vibrator"

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->vibrateAgent:Landroid/os/Vibrator;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v0, "vibrate-enabled"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->vibrateClick:Z

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .registers 5

    const-string p2, "Task menu"

    invoke-interface {p1, p2}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    const p2, 0x7f0d003b

    invoke-virtual {p0, p2}, Lcom/markuspage/android/atimetracker/Tasks;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 p3, 0x0

    const/4 v0, 0x1

    invoke-interface {p1, p3, v0, p3, p2}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const p2, 0x7f0d0035

    invoke-virtual {p0, p2}, Lcom/markuspage/android/atimetracker/Tasks;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 v0, 0x2

    invoke-interface {p1, p3, v0, p3, p2}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const p2, 0x7f0d0059

    invoke-virtual {p0, p2}, Lcom/markuspage/android/atimetracker/Tasks;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 v0, 0x4

    invoke-interface {p1, p3, v0, p3, p2}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .registers 6

    const/4 v0, 0x5

    if-eq p1, v0, :cond_aa

    const/16 v0, 0x8

    if-eq p1, v0, :cond_a5

    const/16 v0, 0xd

    if-eq p1, v0, :cond_8f

    const/16 v0, 0x10

    if-eq p1, v0, :cond_72

    packed-switch p1, :pswitch_data_b0

    const v0, 0x104000a

    const v1, 0x108007a

    const/4 v2, 0x0

    packed-switch p1, :pswitch_data_ba

    return-object v2

    :pswitch_1d
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0d0042

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->exportMessage:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationFailed:Landroid/app/AlertDialog;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationFailed:Landroid/app/AlertDialog;

    return-object p1

    :pswitch_40
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0d0063

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->exportMessage:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationSucceed:Landroid/app/AlertDialog;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationSucceed:Landroid/app/AlertDialog;

    return-object p1

    :pswitch_63
    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->openDeleteTaskDialog()Landroid/app/Dialog;

    move-result-object p1

    return-object p1

    :pswitch_68
    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->openEditTaskDialog()Landroid/app/Dialog;

    move-result-object p1

    return-object p1

    :pswitch_6d
    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->openNewTaskDialog()Landroid/app/Dialog;

    move-result-object p1

    return-object p1

    :cond_72
    new-instance p1, Landroid/app/ProgressDialog;

    invoke-direct {p1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->progressDialog:Landroid/app/ProgressDialog;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->progressDialog:Landroid/app/ProgressDialog;

    const-string v0, "Copying records..."

    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->progressDialog:Landroid/app/ProgressDialog;

    return-object p1

    :cond_8f
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f020001

    new-instance v1, Lcom/markuspage/android/atimetracker/Tasks$2;

    invoke-direct {v1, p0}, Lcom/markuspage/android/atimetracker/Tasks$2;-><init>(Lcom/markuspage/android/atimetracker/Tasks;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1

    :cond_a5
    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->openAboutDialog()Landroid/app/Dialog;

    move-result-object p1

    return-object p1

    :cond_aa
    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks;->openChangeViewDialog()Landroid/app/Dialog;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_b0
    .packed-switch 0x0
        :pswitch_6d
        :pswitch_68
        :pswitch_63
    .end packed-switch

    :pswitch_data_ba
    .packed-switch 0xa
        :pswitch_40
        :pswitch_1d
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 7

    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    const/4 v0, 0x0

    const v1, 0x7f0d0028

    invoke-interface {p1, v0, v0, v0, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    const v2, 0x1080033

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    const/4 v1, 0x1

    const/4 v2, 0x3

    const v3, 0x7f0d0044

    invoke-interface {p1, v0, v2, v1, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v2

    const v3, 0x1080058

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    const/16 v2, 0xd

    const/4 v3, 0x2

    const v4, 0x7f0d004b

    invoke-interface {p1, v0, v2, v3, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p1

    const v0, 0x1080045

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    return v1
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .registers 12

    iget-boolean v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->vibrateClick:Z

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->vibrateAgent:Landroid/os/Vibrator;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    :cond_b
    iget-boolean v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->playClick:Z

    if-eqz v0, :cond_36

    :try_start_f
    sget-object v0, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_14} :catch_15

    goto :goto_36

    :catch_15
    move-exception v0

    const-string v1, "TimeTracker"

    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to play audio: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    :cond_36
    :goto_36
    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_bf

    check-cast v0, Lcom/markuspage/android/atimetracker/Task;

    iget-boolean v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->concurrency:Z

    const/4 v2, 0x1

    if-nez v1, :cond_88

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Task;->isRunning()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-boolean v3, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    if-eqz v3, :cond_79

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    iget-object v3, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    iget-object v4, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v3, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {v3}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->findCurrentlyActive()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_64
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_79

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/markuspage/android/atimetracker/Task;

    invoke-virtual {v4}, Lcom/markuspage/android/atimetracker/Task;->stop()V

    iget-object v5, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {v5, v4}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->updateTask(Lcom/markuspage/android/atimetracker/Task;)V

    goto :goto_64

    :cond_79
    if-eqz v1, :cond_ba

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Task;->start()V

    iput-boolean v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_ba

    :cond_88
    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Task;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_aa

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Task;->stop()V

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {v1}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->findCurrentlyActive()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iput-boolean v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    iget-boolean v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    if-nez v1, :cond_ba

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_ba

    :cond_aa
    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Task;->start()V

    iget-boolean v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    if-nez v1, :cond_ba

    iput-boolean v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_ba
    :goto_ba
    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {v1, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->updateTask(Lcom/markuspage/android/atimetracker/Task;)V

    :cond_bf
    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->invalidate()V

    invoke-super/range {p0 .. p5}, Landroid/app/ListActivity;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V

    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .registers 8

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-eqz v0, :cond_46

    const/4 v1, 0x3

    if-eq v0, v1, :cond_e

    const/16 v1, 0xd

    if-eq v0, v1, :cond_46

    goto :goto_4d

    :cond_e
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/markuspage/android/atimetracker/Report;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "report_date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "start_day"

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "start_day"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "time_display"

    iget-boolean v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->decimalFormat:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "round_report_times"

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "round_report_times"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/markuspage/android/atimetracker/Tasks;->startActivity(Landroid/content/Intent;)V

    goto :goto_4d

    :cond_46
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/markuspage/android/atimetracker/Tasks;->showDialog(I)V

    :goto_4d
    invoke-super {p0, p1, p2}, Landroid/app/ListActivity;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method protected onPause()V
    .registers 3

    invoke-super {p0}, Landroid/app/ListActivity;->onPause()V

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_e
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .registers 4

    const v0, 0x7f080087

    packed-switch p1, :pswitch_data_24

    goto :goto_22

    :pswitch_7
    invoke-virtual {p2, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->selectedTask:Lcom/markuspage/android/atimetracker/Task;

    invoke-virtual {p2}, Lcom/markuspage/android/atimetracker/Task;->getTaskName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_22

    :pswitch_17
    invoke-virtual {p2, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    const-string p2, ""

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :goto_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_17
        :pswitch_7
    .end packed-switch
.end method

.method protected onResume()V
    .registers 4

    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "view_mode"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/markuspage/android/atimetracker/Tasks;->switchView(I)V

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    if-eqz v0, :cond_1e

    iget-boolean v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->running:Z

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks;->updater:Ljava/util/TimerTask;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1e
    return-void
.end method

.method protected onStop()V
    .registers 2

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->close()V

    :cond_9
    sget-object v0, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_12

    sget-object v0, Lcom/markuspage/android/atimetracker/Tasks;->clickPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    :cond_12
    invoke-super {p0}, Landroid/app/ListActivity;->onStop()V

    return-void
.end method

.method protected perform(Ljava/lang/String;II)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_1f

    new-array p3, v1, [Ljava/lang/Object;

    aput-object p1, p3, v0

    invoke-virtual {p0, p2, p3}, Lcom/markuspage/android/atimetracker/Tasks;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->exportMessage:Ljava/lang/String;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationSucceed:Landroid/app/AlertDialog;

    if-eqz p1, :cond_19

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationSucceed:Landroid/app/AlertDialog;

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->exportMessage:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_19
    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->showDialog(I)V

    goto :goto_39

    :cond_1f
    new-array p2, v1, [Ljava/lang/Object;

    aput-object p1, p2, v0

    invoke-virtual {p0, p3, p2}, Lcom/markuspage/android/atimetracker/Tasks;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->exportMessage:Ljava/lang/String;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationFailed:Landroid/app/AlertDialog;

    if-eqz p1, :cond_34

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks;->operationFailed:Landroid/app/AlertDialog;

    iget-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks;->exportMessage:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_34
    const/16 p1, 0xb

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks;->showDialog(I)V

    :goto_39
    return-void
.end method
