.class public final enum Landroid/arch/lifecycle/Lifecycle$State;
.super Ljava/lang/Enum;
.source "Lifecycle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/lifecycle/Lifecycle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/arch/lifecycle/Lifecycle$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum CREATED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum DESTROYED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum INITIALIZED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum RESUMED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum STARTED:Landroid/arch/lifecycle/Lifecycle$State;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v1, "DESTROYED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/arch/lifecycle/Lifecycle$State;->DESTROYED:Landroid/arch/lifecycle/Lifecycle$State;

    new-instance v0, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v1, "INITIALIZED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/arch/lifecycle/Lifecycle$State;->INITIALIZED:Landroid/arch/lifecycle/Lifecycle$State;

    new-instance v0, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v1, "CREATED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/arch/lifecycle/Lifecycle$State;->CREATED:Landroid/arch/lifecycle/Lifecycle$State;

    new-instance v0, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v1, "STARTED"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/arch/lifecycle/Lifecycle$State;->STARTED:Landroid/arch/lifecycle/Lifecycle$State;

    new-instance v0, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v1, "RESUMED"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/arch/lifecycle/Lifecycle$State;->RESUMED:Landroid/arch/lifecycle/Lifecycle$State;

    const/4 v0, 0x5

    new-array v0, v0, [Landroid/arch/lifecycle/Lifecycle$State;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->DESTROYED:Landroid/arch/lifecycle/Lifecycle$State;

    aput-object v1, v0, v2

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->INITIALIZED:Landroid/arch/lifecycle/Lifecycle$State;

    aput-object v1, v0, v3

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->CREATED:Landroid/arch/lifecycle/Lifecycle$State;

    aput-object v1, v0, v4

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->STARTED:Landroid/arch/lifecycle/Lifecycle$State;

    aput-object v1, v0, v5

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->RESUMED:Landroid/arch/lifecycle/Lifecycle$State;

    aput-object v1, v0, v6

    sput-object v0, Landroid/arch/lifecycle/Lifecycle$State;->$VALUES:[Landroid/arch/lifecycle/Lifecycle$State;

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

.method public static valueOf(Ljava/lang/String;)Landroid/arch/lifecycle/Lifecycle$State;
    .registers 2

    const-class v0, Landroid/arch/lifecycle/Lifecycle$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/arch/lifecycle/Lifecycle$State;

    return-object p0
.end method

.method public static values()[Landroid/arch/lifecycle/Lifecycle$State;
    .registers 1

    sget-object v0, Landroid/arch/lifecycle/Lifecycle$State;->$VALUES:[Landroid/arch/lifecycle/Lifecycle$State;

    invoke-virtual {v0}, [Landroid/arch/lifecycle/Lifecycle$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/arch/lifecycle/Lifecycle$State;

    return-object v0
.end method


# virtual methods
.method public isAtLeast(Landroid/arch/lifecycle/Lifecycle$State;)Z
    .registers 2
    .param p1    # Landroid/arch/lifecycle/Lifecycle$State;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0, p1}, Landroid/arch/lifecycle/Lifecycle$State;->compareTo(Ljava/lang/Enum;)I

    move-result p1

    if-ltz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    return p1
.end method
