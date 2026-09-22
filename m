Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D441A575
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065786; cv=pass; b=Mg1o0WoksSr49KhzK31+Qj1xS6U7lhuIJPgPIbP37tVRbhg6HKjbuwSUPocxN6VvG6uTZj1w5upC/DYzcoyrT344zqG/JdmZo7Hxy9p2TXspyA85pg0Rkc8mkGWR3/dH4CND9UAsugKwlCkk+t+enP9QBZuKF44mpvyuu8YNxls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065786; c=relaxed/simple;
	bh=Q4t+g3vnDy2gIUVRjJal60TyzupspjgjVhkD7spJfro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDsmmtIUCYrktoQ8YfCarbYNvFnvKX2riSzHAa9+7OkbAvK+6buzqUZh/npx6b/Ui5wqMSL9ozt/Hey8hF59m2+1vCyqzSVmn4a2tvZLWHnysMGzgmKsZuz55FQW9ToJaQeDnJgPWQIhCGMeeO5qTVsG2uPZJNTqMfti9l0QD6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7fbmZSa; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7fbmZSa"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43ac8d1eso29429597b3.2
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 01:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065784; cv=none;
        d=google.com; s=arc-20260327;
        b=I1b12FfxS2ycNHvjDdBlfwqfSnGsCD/his1Lx2mHDE/eaS+7BhbaHAqyBI/Flha8vb
         MAMMBf5ZzFfWx1unOAIEKlyugw6hYrujbUir2SId/xSBaXpwWovnxlOipvSqFBci7inK
         +XkNCBesazXKphcDqu6veMsOUxLf8nXoNnbRKh1tuDv9xYjCWpgEj9EhbmEbIwsfhmby
         MbGTPisUxbHsYW08txU+jXqirlwqpYqRPVdzV4FF2O+qh0QP6Rj0/rL4AeHtMXvcDh4U
         1vm/oziyCv+Mzy825av8WaAnrMNGdvxRiCt/3KlU/n96NJG0NwOnU8RLfj38hjnv7wR5
         JIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        fh=UJoTdGFCor3Ikch0Z0yqDwAoYOcFQP/o2hgjBy2AVJk=;
        b=CzmkdNNqQWmGRW9p85unuytHR4VnuMAyT7ZL2WEgA+xHnMyj6ZsvV7UwY6Bt6ravfD
         /jHbcBd55hlXvo3agoO4QJlFPBpzTJMNjF1i0rDPqGh8vYWbHwFyscDtCNkbsi/efF2a
         04WPLQaEr/deFH1cmCjIcn2mw4W9wg6ru79JiRiM92C5vWJHF9TG/fFP7cdJIFWgtjhX
         EvdYvWw3mHEhWm4yiGGho25AAw1pqsqoKNJFUXn5UjJW90xIq2f4xPPyvx21gBV5g4hk
         mT3KIw/c6BFSE49MDZx3rHzrgMAOYvTnGz/Zub1vehADfcdnO6F7uvCi5dJUYRoVw7l8
         MPyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065784; x=1790670584; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        b=A7fbmZSarntYJDE0r+FNpUz85Gy2DvbzUvkyMpcwo3i15PUvhVV60wVaafW8GOS2DT
         ocBR9tPUi/IZ+nXQcxc7gT2NybLFrz732mGLyO2/+ssjXayaaxLxUaUPhCTpkvGXyLkc
         v564oOUk857GiVgMRDLoHKb0i2lgBlSUAy4qwoTNV6x25UxH/Crqu2bj26LNLiX58IRK
         cbfgXrptpenPC3Np11fgoz5CtxETEQ9M4LUk5k91EJvvjJxPunSHKpEzrVU1/o1oHOlx
         f6N2begbBDLHGr8AwxnjiNG3RoGtBkuFy8PPI7/M3ulh45YBWMs89zQzuMgyD8sC4fdW
         Bssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065784; x=1790670584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        b=MQ9TMXKItvoJrUTnZ4xvJxJEViugMG6t+XnTyuqeHb5siQYCJcgQ/4TfZE/QKc6dxA
         KD5P6xYHlrb6F0ctq3BTZEh8DLeapMgwNSHyD9V0sktKiq+yyD2wWl3ytY+MbaD/KbDP
         maNzkLkvh65FYZ36ei+tTJV4z2pbTGOUp/pbpJAnxAr7q4o1TPB6MijrYjamPYzg0dLV
         LecpPVRYHpd97yMPcHNc9Ksmu7gYJZ4LWlagJoF07Llrl3jbPCLxtiMTlZ8Y/ah9HuK2
         2wjAcNtsEuYygWLRlhcrN0wLC7Eud9q1ZQLPUEUEupT9YMhHcXUpGsyh+YuzQw3WFZQ+
         50uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfQW+5DXmexhvD6XoOjH6chUsBUp+JfasOtMQtNWYT4E6gxBEfRp6uXRFsYIKTecF5HGM=@lists.linux.dev
X-Gm-Message-State: AFuF++naqUD9y6KAScpHyzxkGjNSUxGEkmbw+9swCeG5L2YXCIhtdjQ+
	cel286h5TdXbkhBCUqEuwWtjXvPeQ1mKo/JYWYv0hLTcjjL0vQ939RgRF6/ODPLm3i4WT8R7G7x
	0WbRoGmbnJG9IQqDchRCrHJ7JYTHBrrQ=
X-Gm-Gg: AYBFou0A8OgdWE+nHTKrk/S+uzLRnlo/1RGrgCvW4yUyvP9JGWLPfcbrj2jsioKSJOz
	iyxaIOqSOAh6EldpTRFUG2fLkDcOQlo1JJ2vhjPlXM3DbO/NfiaZYvXTylFBurEvZJZaijgIHZV
	UsCmYo6/0NhjFNqrrPhhfJWFVob20X5kAmvbZTl1wGd5bHK7bYRTUwmVp2WwJEjl93xelLVUDfM
	JDI7tfAooB5QDZuQFtt/6dmzFFWTX/lf/EofKy3nG1BybXAKMxov5T7MYo9ip4nwSx3vpngtQgl
	ZDW8sineYSuKW4+GCSgiBKe6vmZvj8bglsEU4+90Xaw7kAQT0azBzQ/miA==
X-Received: by 2002:a05:690e:12c7:b0:671:45a4:b282 with SMTP id
 956f58d0204a3-672c5517fddmr641742d50.99.1790065783701; Tue, 22 Sep 2026
 01:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921110909.370945-1-lgs201920130244@gmail.com> <20260922074137.GG2348773@google.com>
In-Reply-To: <20260922074137.GG2348773@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:29:30 +0800
X-Gm-Features: AcwNN1Vv9ooUXHTfX-8aKzoQsfCH4263yxneaXbrNlAHKNAqe0WY7gylNd9nMJc
Message-ID: <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, 
	Ludovic Barre <ludovic.barre@stericsson.com>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Julien Delacou <julien.delacou@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

Thanks.

On Tue, 22 Sept 2026 at 15:41, Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 21 Sep 2026, Guangshuo Li wrote:
>
> > ab8500_probe() registers MFD child devices before completing the
> > remaining device initialization.
> >
> > On AB8540, the main MFD device batch may be registered successfully
> > before registration of the cut-specific batch fails. In that case,
> > the probe returns without removing the child devices registered by
> > the earlier mfd_add_devices() call.
> >
> > The same issue occurs when sysfs group creation fails after the MFD
> > children have been registered. Since the probe returns an error, there
> > is no later teardown path to unregister those devices.
> >
> > Call mfd_remove_devices() on these error paths so that MFD child
> > devices successfully registered earlier in the probe are properly
> > unregistered and released.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> > Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/ab8500-core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> > index f0bc0b5a6f4a..e675223b6023 100644
> > --- a/drivers/mfd/ab8500-core.c
> > +++ b/drivers/mfd/ab8500-core.c
> > @@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
> >               ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
> >                               ARRAY_SIZE(ab8500_devs), NULL,
> >                               0, ab8500->domain);
> > -     if (ret)
> > +     if (ret) {
> > +             mfd_remove_devices(ab8500->dev);
>
> What about switching to devm_*() a.k.a. managed resources?
>
> >               return ret;
> > +     }
> >
> >       /* Add battery management devices */
> >       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > @@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
> >               ret = sysfs_create_group(&ab8500->dev->kobj,
> >                                        &ab8505_attr_group);
> >
> > -     if (ret)
> > +     if (ret) {
> >               dev_err(ab8500->dev, "error creating sysfs entries\n");
> > +             mfd_remove_devices(ab8500->dev);
> > +     }
> >
> >       return ret;
> >  }
> > --
> > 2.43.0
> >
>
> --
> Lee Jones

Do you mean converting the MFD registrations in ab8500_probe() to
devm_mfd_add_devices(), so the children are cleaned up automatically on
probe failure, e.g.:

-       ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
+       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
                              ARRAY_SIZE(ab8540_devs), NULL,
                              0, ab8500->domain);

        ...

-       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
+       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
                              ARRAY_SIZE(ab8500_bm_devs), NULL,
                              0, ab8500->domain);

and likewise for the other MFD batches?

If so, I'll rework the patch that way for v2.

Thanks,
Guangshuo
