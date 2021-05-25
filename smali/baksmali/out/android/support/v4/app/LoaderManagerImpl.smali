.class Landroid/support/v4/app/LoaderManagerImpl;
.super Landroid/support/v4/app/LoaderManager;
.source "LoaderManagerImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;,
        Landroid/support/v4/app/LoaderManagerImpl$LoaderObserver;,
        Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;
    }
.end annotation


# static fields
.field static DEBUG:Z = false

.field static final TAG:Ljava/lang/String; = "LoaderManager"


# instance fields
.field private final mLifecycleOwner:Landroid/arch/lifecycle/LifecycleOwner;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method constructor <init>(Landroid/arch/lifecycle/LifecycleOwner;Landroid/arch/lifecycle/ViewModelStore;)V
    .registers 3
    .param p1    # Landroid/arch/lifecycle/LifecycleOwner;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/arch/lifecycle/ViewModelStore;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Landroid/support/v4/app/LoaderManager;-><init>()V

    iput-object p1, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLifecycleOwner:Landroid/arch/lifecycle/LifecycleOwner;

    invoke-static {p2}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->getInstance(Landroid/arch/lifecycle/ViewModelStore;)Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    return-void
.end method

.method private createAndInstallLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;Landroid/support/v4/content/Loader;)Landroid/support/v4/content/Loader;
    .registers 7
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/support/v4/content/Loader;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<D:",
            "Ljava/lang/Object;",
            ">(I",
            "Landroid/os/Bundle;",
            "Landroid/support/v4/app/LoaderManager$LoaderCallbacks<",
            "TD;>;",
            "Landroid/support/v4/content/Loader<",
            "TD;>;)",
            "Landroid/support/v4/content/Loader<",
            "TD;>;"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->startCreatingLoader()V

    invoke-interface {p3, p1, p2}, Landroid/support/v4/app/LoaderManager$LoaderCallbacks;->onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;

    move-result-object v0

    if-eqz v0, :cond_6b

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isMemberClass()Z

    move-result v1

    if-eqz v1, :cond_3b

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getModifiers()I

    move-result v1

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v1

    if-eqz v1, :cond_24

    goto :goto_3b

    :cond_24
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Object returned from onCreateLoader must not be a non-static inner member class: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3b
    :goto_3b
    new-instance v1, Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;

    invoke-direct {v1, p1, p2, v0, p4}, Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;-><init>(ILandroid/os/Bundle;Landroid/support/v4/content/Loader;Landroid/support/v4/content/Loader;)V

    sget-boolean p2, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz p2, :cond_5a

    const-string p2, "LoaderManager"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "  Created new loader "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p2, p4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5a
    iget-object p2, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {p2, p1, v1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->putLoader(ILandroid/support/v4/app/LoaderManagerImpl$LoaderInfo;)V
    :try_end_5f
    .catchall {:try_start_0 .. :try_end_5f} :catchall_73

    iget-object p1, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {p1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->finishCreatingLoader()V

    iget-object p1, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLifecycleOwner:Landroid/arch/lifecycle/LifecycleOwner;

    invoke-virtual {v1, p1, p3}, Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;->setCallback(Landroid/arch/lifecycle/LifecycleOwner;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object p1

    return-object p1

    :cond_6b
    :try_start_6b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Object returned from onCreateLoader must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_73
    .catchall {:try_start_6b .. :try_end_73} :catchall_73

    :catchall_73
    move-exception p1

    iget-object p2, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {p2}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->finishCreatingLoader()V

    throw p1
.end method


# virtual methods
.method public destroyLoader(I)V
    .registers 5
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->isCreatingLoader()Z

    move-result v0

    if-nez v0, :cond_4e

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_46

    sget-boolean v0, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz v0, :cond_34

    const-string v0, "LoaderManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "destroyLoader in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_34
    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->getLoader(I)Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;

    move-result-object v0

    if-eqz v0, :cond_45

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;->destroy(Z)Landroid/support/v4/content/Loader;

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->removeLoader(I)V

    :cond_45
    return-void

    :cond_46
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "destroyLoader must be called on the main thread"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4e
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Called while creating a loader"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public getLoader(I)Landroid/support/v4/content/Loader;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<D:",
            "Ljava/lang/Object;",
            ">(I)",
            "Landroid/support/v4/content/Loader<",
            "TD;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->isCreatingLoader()Z

    move-result v0

    if-nez v0, :cond_17

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->getLoader(I)Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;

    move-result-object p1

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;->getLoader()Landroid/support/v4/content/Loader;

    move-result-object p1

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    :goto_16
    return-object p1

    :cond_17
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Called while creating a loader"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public hasRunningLoaders()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->hasRunningLoaders()Z

    move-result v0

    return v0
.end method

.method public initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;
    .registers 8
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<D:",
            "Ljava/lang/Object;",
            ">(I",
            "Landroid/os/Bundle;",
            "Landroid/support/v4/app/LoaderManager$LoaderCallbacks<",
            "TD;>;)",
            "Landroid/support/v4/content/Loader<",
            "TD;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->isCreatingLoader()Z

    move-result v0

    if-nez v0, :cond_6b

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_63

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->getLoader(I)Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;

    move-result-object v0

    sget-boolean v1, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz v1, :cond_3a

    const-string v1, "LoaderManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initLoader in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ": args="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3a
    if-nez v0, :cond_42

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v4/app/LoaderManagerImpl;->createAndInstallLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;Landroid/support/v4/content/Loader;)Landroid/support/v4/content/Loader;

    move-result-object p1

    return-object p1

    :cond_42
    sget-boolean p1, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz p1, :cond_5c

    const-string p1, "LoaderManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  Re-using existing loader "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5c
    iget-object p1, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLifecycleOwner:Landroid/arch/lifecycle/LifecycleOwner;

    invoke-virtual {v0, p1, p3}, Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;->setCallback(Landroid/arch/lifecycle/LifecycleOwner;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object p1

    return-object p1

    :cond_63
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "initLoader must be called on the main thread"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Called while creating a loader"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public markForRedelivery()V
    .registers 2

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->markForRedelivery()V

    return-void
.end method

.method public restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;
    .registers 7
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<D:",
            "Ljava/lang/Object;",
            ">(I",
            "Landroid/os/Bundle;",
            "Landroid/support/v4/app/LoaderManager$LoaderCallbacks<",
            "TD;>;)",
            "Landroid/support/v4/content/Loader<",
            "TD;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->isCreatingLoader()Z

    move-result v0

    if-nez v0, :cond_4f

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_47

    sget-boolean v0, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz v0, :cond_34

    const-string v0, "LoaderManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "restartLoader in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ": args="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_34
    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLoaderViewModel:Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->getLoader(I)Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_42

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/app/LoaderManagerImpl$LoaderInfo;->destroy(Z)Landroid/support/v4/content/Loader;

    move-result-object v1

    :cond_42
    invoke-direct {p0, p1, p2, p3, v1}, Landroid/support/v4/app/LoaderManagerImpl;->createAndInstallLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;Landroid/support/v4/content/Loader;)Landroid/support/v4/content/Loader;

    move-result-object p1

    return-object p1

    :cond_47
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "restartLoader must be called on the main thread"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4f
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Called while creating a loader"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "LoaderManager{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/app/LoaderManagerImpl;->mLifecycleOwner:Landroid/arch/lifecycle/LifecycleOwner;

    invoke-static {v1, v0}, Landroid/support/v4/util/DebugUtils;->buildShortClassTag(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    const-string v1, "}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
