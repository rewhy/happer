.class Landroid/arch/lifecycle/LiveData$AlwaysActiveObserver;
.super Landroid/arch/lifecycle/LiveData$ObserverWrapper;
.source "LiveData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/lifecycle/LiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlwaysActiveObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/arch/lifecycle/LiveData<",
        "TT;>.ObserverWrapper;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/arch/lifecycle/LiveData;


# direct methods
.method constructor <init>(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/Observer;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/arch/lifecycle/Observer<",
            "TT;>;)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop

    nop

    nop
.end method


# virtual methods
.method shouldBeActive()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
