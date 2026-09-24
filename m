Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53163CBE9C
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260216; cv=pass; b=sq8M8KTu9gfI/eIcF0Z3NiM4vSBMfUNdzdWOAKGiIirnKnB0QfhB9H5F0NzEkYcZZInsLRc27xuzc0I7GsrVOtB1ktGF1x+kVaC2PFDQFHut8pQjNij+JCrQvS9yxSbZq1lvVPF7GYbTBZqCvKYROh9yhrqDgqzqaWdshUJXRnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260216; c=relaxed/simple;
	bh=DEXzrGZJZ5pZsu6Nmf3KfFvACPsKM8vrFc+DWmGfen0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRHUSzg5MExXtXI4dl8EaB9rrOyCavXV+F5XdxN8FrGxZxVwmy3+R/2S6Lt0PG9Br5cc+rhLOxRydASI5y/HtL4JHgWgUUmwWNf5D0+2Ex2P+dXfSYzD01YAmQjO7YobZmUjkyYLWkDoK8xMEt9orEM7rcqNSMnh48UFFbVGpoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3mTz6GV; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3mTz6GV"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso2455414d50.0
        for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 07:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790260213; cv=none;
        d=google.com; s=arc-20260327;
        b=kQVTBoo+eNO6t6V3bgo16d2G1R4U8dOncHc7xSFF5/UbKHnO9sbeoKrMLGShiA+xwh
         LPegDgn0A7fwlLunjoFkeeNVoCHLpMqd6YaLawQtePm2g+ytwfwW1G9r5kSRh2uBlN2j
         Au2pulwb4LSs8SqIWsFY7Bd5RuP4UkR+AoxWbpDqxqEj4t8g11Y7xP/t1tvixFEuMtIw
         aK5RCOgyp8Ilgw4x6Vr5Vr6lWLSPeBKQu45BEy/91ygwe5RYYr+gNXYqDjbQvNDHmkmN
         l2IUZ2+D3UDfYJlkD3/moOoioUhUMsKEO1frRKc+SXMYf0ppjbhE3gI07ZMIkgqEtXTC
         wujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        fh=RW/Wot9CEGiIgFWuLPBhC7zdC/qxGX+GeHy6M2SH2ZA=;
        b=Cfo4Fef0o/Je4dhCS9ueaSODM93gtse3eWQW3kjOOEnd/Dtq2wChG3BaZKma5oHtF1
         118cFLdfXkv0KNP3LXGfGevdKyMq4o+PxonwZdWNzLFpfFZYpguJ1GXhnPgaMh5SLV8j
         UK5kI3cuNUFJ3TwfOQzqfjtvmzF5MDKPy01OoTvBgklNCinbSLKu9RFFAox20qaFjH/q
         V4I6EUOJBOV1ZlAZsPriN9dMP7G0FaklOzy2lmrsCc/m2uIL810QtCrXRrDE7BpmUSRZ
         Z/LCpbJ/Gum/lgRhh3UVwkrZyrnN3FhYPvsH81SDf41BdDR+VcCrrWOL3uzaPpmMm0sJ
         FJ2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790260213; x=1790865013; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        b=G3mTz6GVQYHma+zKLrfc5BN3M97ctoIKkC5lavlltjqP/AazYhvAI43QnVxO+FS3X3
         2ZfwGch7Wul8fHPbusLaWz03eCg5pcwF7JDNIU9YuNhg3gFOIPT2C3P12JWTmNrDMP5P
         h0dD1LY3KsG8fBIBJ+fBewptwCbXbKwio/RWHsOf5nc36+alhXpS++34xwYJAXog2yKh
         lFTfeAge3hH68/XSslq9iMWwvgYoFOCxDZyKQy+i+cfZ9AtTOc0yPahI/nacCNDS7qF3
         dAuERsnstISGBSVtN26qfq/vwR88yiGzj3ylYZPJzdiReUQEOLKrjgUgILl+/kdRoWAo
         70yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260213; x=1790865013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        b=jqx88SbOaMliRgurIinRFuTe4154HBw1W3u3TYiZ35C629tmJTWUqZTFOvDgPVu1dE
         T/dnn8xqk5BcL5v9wqmCWmV2prHstxA7Cqa/UzOkQjjDh6dcWJHDHESOMzCV5TO3zxAq
         52BQN4/w97sH4HEcNtQ0f7aXAsDDulTMuDRaj6zQ9AxxrJaN99dFzdMVLaaCfPBIRSjU
         bqDJkV1jlT0q+uTgUIWhfyoxjDh4ddi9CJlIlbAsZsjFZDkreh8zwLhx9gRS+WSnPuJ5
         EVt/A9UxQZfX4/hnCHMV69ZD1jqLIKWhZEL+xDziXJ9QGhZyOhbFOLBAZ/tQVHTMwNhr
         aeTA==
X-Forwarded-Encrypted: i=1; AKwUvBzEBSpqkro7FCt/IBrZ0Ve5m4t9cg4Mr5cOOz1lTcO87AkODUe75SDQ/3L7vdPIP8EgK1M=@lists.linux.dev
X-Gm-Message-State: AFuF++kISbGMtYM1ulXp//VYkZtB46MvkCb5RFAhLwtbDkDBk3Y/l++F
	QH+ncf7ELgI2XpcgeUEI6EvKpYwIvZ4q2+VawYh/s9/lCmpLfgfaaSvrZ9oFJyGDDNuojT05EzM
	iuBKaCGFsHYcmvrTpoBo4UVN6r+CdwGo=
X-Gm-Gg: AYBFou3ZgFM1NzzOPnLYUhnN8JJcmmw5fAiw4HDMwR4GBaBFuRbtC6JK8BSA8ZQ8ejY
	qjLksDGfR6k79Ne5zGeiaonVFdQQS4WU/opOrgGrhNO9KEM1RMMwc/4i8cvLUK0w++6RaeUZ++1
	VsK8qPndqOue4LW4aph8QEnoQwYlDCadG8QBqJi5N0CuLiVQOEXfvDozKDXyqFleyNLufMB9PAn
	vBUWzSFfKiXhH75+VFdeOr5DXLnm499x+s36atY//FAhvT411ysNyXSEWx8ci2EN4geMrcEdjZs
	LyKMyPicmsjBlTjGnxm0+tfkWiJdqY7iNqnpChLsb9W5dMFn59xOA/9/MOKVZ26vSsg7qQ==
X-Received: by 2002:a05:690e:c45:b0:66f:d093:c206 with SMTP id
 956f58d0204a3-672ed204704mr1327519d50.17.1790260212896; Thu, 24 Sep 2026
 07:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921110909.370945-1-lgs201920130244@gmail.com>
 <20260922074137.GG2348773@google.com> <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
 <20260922150642.GH3277918@google.com>
In-Reply-To: <20260922150642.GH3277918@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 22:30:02 +0800
X-Gm-Features: AclHuK860EhogXR6CM7Mg1y8PIyfTwBtwpDGRzp_GvIpNMBtaMogNwOv8vHFZoQ
Message-ID: <CANUHTR-iuuGMTWT4_C5TMjtTBE4sYAWcD_N8Jwf8WnJs84b43g@mail.gmail.com>
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, 
	Ludovic Barre <ludovic.barre@stericsson.com>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Julien Delacou <julien.delacou@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, Lee.

On Tue, 22 Sept 2026 at 23:06, Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 22 Sep 2026, Guangshuo Li wrote:
>
> > Hi Lee,
> >
> > Thanks.
> >
> > On Tue, 22 Sept 2026 at 15:41, Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Mon, 21 Sep 2026, Guangshuo Li wrote:
> > >
> > > > ab8500_probe() registers MFD child devices before completing the
> > > > remaining device initialization.
> > > >
> > > > On AB8540, the main MFD device batch may be registered successfully
> > > > before registration of the cut-specific batch fails. In that case,
> > > > the probe returns without removing the child devices registered by
> > > > the earlier mfd_add_devices() call.
> > > >
> > > > The same issue occurs when sysfs group creation fails after the MFD
> > > > children have been registered. Since the probe returns an error, there
> > > > is no later teardown path to unregister those devices.
> > > >
> > > > Call mfd_remove_devices() on these error paths so that MFD child
> > > > devices successfully registered earlier in the probe are properly
> > > > unregistered and released.
> > > >
> > > > The issue was identified by a static analysis tool I developed and
> > > > confirmed by manual review.
> > > >
> > > > Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> > > > Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > > ---
> > > >  drivers/mfd/ab8500-core.c | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> > > > index f0bc0b5a6f4a..e675223b6023 100644
> > > > --- a/drivers/mfd/ab8500-core.c
> > > > +++ b/drivers/mfd/ab8500-core.c
> > > > @@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > > >               ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
> > > >                               ARRAY_SIZE(ab8500_devs), NULL,
> > > >                               0, ab8500->domain);
> > > > -     if (ret)
> > > > +     if (ret) {
> > > > +             mfd_remove_devices(ab8500->dev);
> > >
> > > What about switching to devm_*() a.k.a. managed resources?
> > >
> > > >               return ret;
> > > > +     }
> > > >
> > > >       /* Add battery management devices */
> > > >       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > > > @@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > > >               ret = sysfs_create_group(&ab8500->dev->kobj,
> > > >                                        &ab8505_attr_group);
> > > >
> > > > -     if (ret)
> > > > +     if (ret) {
> > > >               dev_err(ab8500->dev, "error creating sysfs entries\n");
> > > > +             mfd_remove_devices(ab8500->dev);
> > > > +     }
> > > >
> > > >       return ret;
> > > >  }
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > --
> > > Lee Jones
> >
> > Do you mean converting the MFD registrations in ab8500_probe() to
> > devm_mfd_add_devices(), so the children are cleaned up automatically on
> > probe failure, e.g.:
> >
> > -       ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
> > +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
> >                               ARRAY_SIZE(ab8540_devs), NULL,
> >                               0, ab8500->domain);
> >
> >         ...
> >
> > -       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> >                               ARRAY_SIZE(ab8500_bm_devs), NULL,
> >                               0, ab8500->domain);
> >
> > and likewise for the other MFD batches?
> >
> > If so, I'll rework the patch that way for v2.
>
> Yes.
>
> --
> Lee Jones

I'll convert all the MFD registrations to devm_mfd_add_devices() and
send a v2.

Thanks,
Guangshuo
