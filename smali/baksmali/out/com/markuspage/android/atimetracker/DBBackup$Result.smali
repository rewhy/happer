.class public final enum Lcom/markuspage/android/atimetracker/DBBackup$Result;
.super Ljava/lang/Enum;
.source "DBBackup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/markuspage/android/atimetracker/DBBackup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/markuspage/android/atimetracker/DBBackup$Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/markuspage/android/atimetracker/DBBackup$Result;

.field public static final enum FAILURE:Lcom/markuspage/android/atimetracker/DBBackup$Result;

.field public static final enum SUCCESS:Lcom/markuspage/android/atimetracker/DBBackup$Result;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/markuspage/android/atimetracker/DBBackup$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;->SUCCESS:Lcom/markuspage/android/atimetracker/DBBackup$Result;

    new-instance v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;

    const-string v1, "FAILURE"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/markuspage/android/atimetracker/DBBackup$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;->FAILURE:Lcom/markuspage/android/atimetracker/DBBackup$Result;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/markuspage/android/atimetracker/DBBackup$Result;

    sget-object v1, Lcom/markuspage/android/atimetracker/DBBackup$Result;->SUCCESS:Lcom/markuspage/android/atimetracker/DBBackup$Result;

    aput-object v1, v0, v2

    sget-object v1, Lcom/markuspage/android/atimetracker/DBBackup$Result;->FAILURE:Lcom/markuspage/android/atimetracker/DBBackup$Result;

    aput-object v1, v0, v3

    sput-object v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;->$VALUES:[Lcom/markuspage/android/atimetracker/DBBackup$Result;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/markuspage/android/atimetracker/DBBackup$Result;
    .registers 2

    const-class v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/markuspage/android/atimetracker/DBBackup$Result;

    return-object p0
.end method

.method public static values()[Lcom/markuspage/android/atimetracker/DBBackup$Result;
    .registers 1

    sget-object v0, Lcom/markuspage/android/atimetracker/DBBackup$Result;->$VALUES:[Lcom/markuspage/android/atimetracker/DBBackup$Result;

    invoke-virtual {v0}, [Lcom/markuspage/android/atimetracker/DBBackup$Result;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/markuspage/android/atimetracker/DBBackup$Result;

    return-object v0
.end method
