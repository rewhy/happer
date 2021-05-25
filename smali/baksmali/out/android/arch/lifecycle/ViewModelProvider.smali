.class public Landroid/arch/lifecycle/ViewModelProvider;
.super Ljava/lang/Object;
.source "ViewModelProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/arch/lifecycle/ViewModelProvider$AndroidViewModelFactory;,
        Landroid/arch/lifecycle/ViewModelProvider$NewInstanceFactory;,
        Landroid/arch/lifecycle/ViewModelProvider$Factory;
    }
.end annotation


# static fields
.field private static final DEFAULT_KEY:Ljava/lang/String; = "android.arch.lifecycle.ViewModelProvider.DefaultKey"


# instance fields
.field private final mFactory:Landroid/arch/lifecycle/ViewModelProvider$Factory;

.field private final mViewModelStore:Landroid/arch/lifecycle/ViewModelStore;


# direct methods
.method public constructor <init>(Landroid/arch/lifecycle/ViewModelStore;Landroid/arch/lifecycle/ViewModelProvider$Factory;)V
    .registers 3
    .param p1    # Landroid/arch/lifecycle/ViewModelStore;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/arch/lifecycle/ViewModelProvider$Factory;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public constructor <init>(Landroid/arch/lifecycle/ViewModelStoreOwner;Landroid/arch/lifecycle/ViewModelProvider$Factory;)V
    .registers 3
    .param p1    # Landroid/arch/lifecycle/ViewModelStoreOwner;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/arch/lifecycle/ViewModelProvider$Factory;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method


# virtual methods
.method public get(Ljava/lang/Class;)Landroid/arch/lifecycle/ViewModel;
    .registers 5
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/arch/lifecycle/ViewModel;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public get(Ljava/lang/String;Ljava/lang/Class;)Landroid/arch/lifecycle/ViewModel;
    .registers 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/arch/lifecycle/ViewModel;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method
