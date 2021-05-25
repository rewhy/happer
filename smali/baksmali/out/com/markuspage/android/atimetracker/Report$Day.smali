.class final enum Lcom/markuspage/android/atimetracker/Report$Day;
.super Ljava/lang/Enum;
.source "Report.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/markuspage/android/atimetracker/Report;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Day"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/markuspage/android/atimetracker/Report$Day;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/markuspage/android/atimetracker/Report$Day;

.field public static final enum FRIDAY:Lcom/markuspage/android/atimetracker/Report$Day;

.field public static final enum MONDAY:Lcom/markuspage/android/atimetracker/Report$Day;

.field public static final enum SATURDAY:Lcom/markuspage/android/atimetracker/Report$Day;

.field public static final enum SUNDAY:Lcom/markuspage/android/atimetracker/Report$Day;

.field public static final enum THURSDAY:Lcom/markuspage/android/atimetracker/Report$Day;

.field public static final enum TUESDAY:Lcom/markuspage/android/atimetracker/Report$Day;

.field public static final enum WEDNESDAY:Lcom/markuspage/android/atimetracker/Report$Day;


# instance fields
.field public calEnum:I

.field public header:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Lcom/markuspage/android/atimetracker/Report$Day;

    const-string v1, "MONDAY"

    const-string v2, "Mon"

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/markuspage/android/atimetracker/Report$Day;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->MONDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    new-instance v0, Lcom/markuspage/android/atimetracker/Report$Day;

    const-string v1, "TUESDAY"

    const-string v2, "Tue"

    const/4 v5, 0x3

    const/4 v6, 0x1

    invoke-direct {v0, v1, v6, v5, v2}, Lcom/markuspage/android/atimetracker/Report$Day;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->TUESDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    new-instance v0, Lcom/markuspage/android/atimetracker/Report$Day;

    const-string v1, "WEDNESDAY"

    const-string v2, "Wed"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v4, v7, v2}, Lcom/markuspage/android/atimetracker/Report$Day;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->WEDNESDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    new-instance v0, Lcom/markuspage/android/atimetracker/Report$Day;

    const-string v1, "THURSDAY"

    const-string v2, "Thu"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v5, v8, v2}, Lcom/markuspage/android/atimetracker/Report$Day;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->THURSDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    new-instance v0, Lcom/markuspage/android/atimetracker/Report$Day;

    const-string v1, "FRIDAY"

    const-string v2, "Fri"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v7, v9, v2}, Lcom/markuspage/android/atimetracker/Report$Day;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->FRIDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    new-instance v0, Lcom/markuspage/android/atimetracker/Report$Day;

    const-string v1, "SATURDAY"

    const-string v2, "Sat"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v8, v10, v2}, Lcom/markuspage/android/atimetracker/Report$Day;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->SATURDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    new-instance v0, Lcom/markuspage/android/atimetracker/Report$Day;

    const-string v1, "SUNDAY"

    const-string v2, "Sun"

    invoke-direct {v0, v1, v9, v6, v2}, Lcom/markuspage/android/atimetracker/Report$Day;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->SUNDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    new-array v0, v10, [Lcom/markuspage/android/atimetracker/Report$Day;

    sget-object v1, Lcom/markuspage/android/atimetracker/Report$Day;->MONDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    aput-object v1, v0, v3

    sget-object v1, Lcom/markuspage/android/atimetracker/Report$Day;->TUESDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    aput-object v1, v0, v6

    sget-object v1, Lcom/markuspage/android/atimetracker/Report$Day;->WEDNESDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    aput-object v1, v0, v4

    sget-object v1, Lcom/markuspage/android/atimetracker/Report$Day;->THURSDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    aput-object v1, v0, v5

    sget-object v1, Lcom/markuspage/android/atimetracker/Report$Day;->FRIDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    aput-object v1, v0, v7

    sget-object v1, Lcom/markuspage/android/atimetracker/Report$Day;->SATURDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    aput-object v1, v0, v8

    sget-object v1, Lcom/markuspage/android/atimetracker/Report$Day;->SUNDAY:Lcom/markuspage/android/atimetracker/Report$Day;

    aput-object v1, v0, v9

    sput-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->$VALUES:[Lcom/markuspage/android/atimetracker/Report$Day;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/markuspage/android/atimetracker/Report$Day;->calEnum:I

    iput-object p4, p0, Lcom/markuspage/android/atimetracker/Report$Day;->header:Ljava/lang/String;

    return-void
.end method

.method static fromCalEnum(I)Lcom/markuspage/android/atimetracker/Report$Day;
    .registers 6

    invoke-static {}, Lcom/markuspage/android/atimetracker/Report$Day;->values()[Lcom/markuspage/android/atimetracker/Report$Day;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    iget v4, v3, Lcom/markuspage/android/atimetracker/Report$Day;->calEnum:I

    if-ne v4, p0, :cond_f

    return-object v3

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_12
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/markuspage/android/atimetracker/Report$Day;
    .registers 2

    const-class v0, Lcom/markuspage/android/atimetracker/Report$Day;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/markuspage/android/atimetracker/Report$Day;

    return-object p0
.end method

.method public static values()[Lcom/markuspage/android/atimetracker/Report$Day;
    .registers 1

    sget-object v0, Lcom/markuspage/android/atimetracker/Report$Day;->$VALUES:[Lcom/markuspage/android/atimetracker/Report$Day;

    invoke-virtual {v0}, [Lcom/markuspage/android/atimetracker/Report$Day;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/markuspage/android/atimetracker/Report$Day;

    return-object v0
.end method


# virtual methods
.method public calEnum()I
    .registers 2

    iget v0, p0, Lcom/markuspage/android/atimetracker/Report$Day;->calEnum:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Report$Day;->header:Ljava/lang/String;

    return-object v0
.end method
