Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119247;
	b=Mb8AAdK/0R+VSq9RX/A/nxqwSuZX4+8S+kRdcmMr0UeS4/4vmn9f7bHAqeYMfsCkZZ+f
	 LudXEImHDP+tJwv6kCSOyz1pyEJWbEqj36S8u3mLkoFk1nMkzUo0+JsrVnsJv7nu2XMfG
	 p9OpMcCvjzXKOjLwjSrNH391B57ZdRQ0ZLcGI82vIM13h+6VJ+zEMJmyx6ibR96J8p4s9
	 te4hd7Z2T7laXXFVqI1ju9xjISn7aZdcaNv50c/G0YwRtJK7ug01O709mMQ+TEDjX9Am5
	 NZ6NdAEi87yrrasFvawximrz71aoMWfjWUoWtPsmfefUQq/ugdR5pg8EE4dzjUrIu1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
	b=uSwQ5YLo4MEEnJiZ6XA+0UtLm2xb8SHklJHBOIGE2I/kLQgKwUpCQAXawSe8APAzyeFo
	 Khsl+YQ4kPbxWOqSNRIuN9tBOFcZ8slTQoHbiGq8T/RHzeJRaWV5605O4yNnPZ2hm8JkX
	 YkIEzdIdmKabW/6m55cDwwBp8f0YevFl6at1r5xK26Gjbj6vDuYuEU2OLadmUHeLydkAr
	 XqGTQkMxOo9Xq/LgoS+o5AXgg3rJzWDsmlPqAqjIvCBwWgZynGjeiIczmIoy6ZPKEg++s
	 JUsLUELPdQ/LY79VuNJyqRiOz6j+XVY4qVT53ZRlwiDO85ENIJhTPNdIxK+iKwASDyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pV+WnkB9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573B606A31E
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 16:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B573B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pV+WnkB9
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b05bf699easo41480287b3.2
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 09:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119246; cv=none;
        d=google.com; s=arc-20260327;
        b=XhYNdmY82XeKgHtvcW8NMlrQcVSfrcs9KSJwhio/RGdc50zwMb5VQvE3wB5vpTBkfs
         s8nk5ERoDRt3P4HkqGnGE6Bf/+aQGAqPeXHztGeNn4/+TJSkriLPrgocuvYSNWn5Vy29
         yNhZ/ErHiRDE5uPwkRVnXogJui205SzhZa8C6ioH2PnkkKE79sI9e8pgQQ3elKbmZcI5
         v9bPzdOtRoBV3Y1/2wV0zG9WbP2wWsNRZvhg6M7GHF4+/kjaoj9DR+apRqKhmDGjPbNd
         k2JauNQ2OrtsZA+QWU6XpIDZOYEnyZrPXSksVInDPOV+L+K8z/O9yE130XL1Xol0cwWb
         7Bng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
        fh=lA8NA8aYuUNM8gfbN+Abq6DLmARbQD2Bqxhg9efy7x0=;
        b=cz7q4DnQ//MCdynvcKt33JJR2QTHABiGVIBhMqyT5Er16zVcljjT1+VkwMvAh7XITk
         tF8gWoK6k0JkTynD4pO4/5Ilw6EmNyGdKA3oa+W6g3Gp+ALQXlFsFNnt10sGKelk6Mwo
         auP95VPi0rRp+1JK+3gsfb749yTTf1nUPzWcA0lY8JV3o7GAA56jC4Kr8Jp88E+dkD1d
         GBcoCMrc7Rm/EtzedJI9bUp8RBCnDzBgfgTbY0BzcZejjapHUzrl9JNAy6g7VEP2gAM/
         HuMnmWvkdjNbDB+pLPKTfBglLkdyHmFa+7IbBb3NNKrrdajnQaj9QbhYW8Lc9NXcWhqo
         QGHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119246; x=1793724046; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
        b=pV+WnkB9w5Ef4b3157wSlQYrUa4YzJN/jHiduKnZivbCenR9OCArbrjdBLmeBwH71i
         16Hk8G9enFdKlekUoi8IGyHf4uh8qLuy9XcE9oGx4zqArKJcJ3JdMCETUKx5j2jIMSTH
         37BR7rpeedUHWv6YOFqxnrASR9vX7DuM+FUtDKm1XWINz2E5bg48r9igjmJaoasN+qvw
         +nhVKJplERgE+lVU2ZcMnSAAd9eQwo8SraiMZ4BPTN0h2HRb3YnwjZRJu7sBO2OKOPa1
         poFxCU+WmUm4DQs7NrpPmTxoeAHMG1DwhPp7NYlZqUE9OE89Q67E4+70HxZjv5XC4RTd
         xXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119246; x=1793724046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
        b=u1J5i+w75QQ0eX0pGK+JKk1hxBo5u+3s4ryf1okpv26hwFBOU7o5d8MjZEaCOter9r
         S9kiKr2CTUP52U5z6/R+b0y7ZvxXgPHxoxuIWEcIDA+YE4fNZ3epXN+a2msJQsHp949W
         94cpVddP+7jAStVrUaS5/pl4KTMJ3wC9ebWboCI38+fgKCuSG5l4u5nPkqMPFF8GkWT7
         6/2fNxvEmua3z5Doj73QDkCm98s3h1BxoxH9m2mYLuRmfxqbovdJMDM2SHfl/VvVOdR9
         WT3A/DjQmCPlL5Wqr4uzbc0DcH5JhIf8K/RgofHjmMSVZJLDGKfRlcK6jZIt4FU1Yrhi
         +LGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaPTxz78gbsJvnVFqRZJN8n4UFMMNX3N+6qspzZBDpnn1vCeR9G853V3Vj12B+ZWzgRlE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLxvPC435DQkgTKQXFonqC1xsl1VdtShjZ1xClLK919oGXLtLUy
	CQJzDeDb1cKxYc6Rh6DMeaYqx3PNibhxq8Dw4zpF2Cj8oIo6VAGuw2hx3w3IPor8+pT3Os9JrID
	XSjMew8m0b0qp7zreI4nZKpJvlWXhGmI=
X-Gm-Gg: AYBFou2HFlMIWxdM4ILdefdUoe7+oldmtRXba54boRC3FFTp1MAjH4Vw3NH9VsfnOzA
	8Qi2R7Mz8X7jgvjsubaQBv0LDGix+95xYvQCTxn+ION/gLbuF1G/QvAvGzj24kmVwfc6TSfopWO
	jw4k0bLIeiBUKdpzuX1F+H6dJmD+3UXbkwHTrKXesk8PRJPn5sQ8y4NibnCEDhEoufXEEUH1Qub
	my1isD3EfATlHfB7W8tWNFb2Khaj2Z82hZQGsj/pQavQMDWuB6y/CRkulzP/laSeos7DYwk/6lA
	prPCKRDyn4QYL9K7x94CQvOJyjdP4JgNnRFMchz04K2EELqAyicsS0RKt5OoSC0SMl1EiwJvLiH
	I7KKH0O1hQCSmfGGlUjVK0lP3QBF/WOBCdy9a
X-Received: by 2002:a05:690e:21c9:b0:678:151:5218 with SMTP id
 956f58d0204a3-67a7bd81c3cmr32130d50.110.1793119245748; Tue, 27 Oct 2026
 09:40:45 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027032609.119226-1-lgs201920130244@gmail.com> <179310015976.2808517.13064510476219400398@kernel.org>
In-Reply-To: <179310015976.2808517.13064510476219400398@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:40:33 +0800
X-Gm-Features: AclHuK8AK6dZaz6wgjS33W_jF3KCjGoJH6NgyB5biX1dQWpffjnyXhNOXiRNnyU
Message-ID: <CANUHTR8Ypwpm+Qqmk-fob1=e040rRH5QGTs7gN6MWRKQYyOdCw@mail.gmail.com>
Subject: Re: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, 
	Samuel Ortiz <sameo@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
	linux-omap@vger.kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

On Wed, 28 Oct 2026 at 00:26, Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 27 Oct 2026, Guangshuo Li wrote:
>
> > twl6040_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. This destroys the IRQ mappings
> > before the child drivers can release their interrupt handlers.
> >
> > The parent driver also registers READY and thermal interrupt
> > handlers using devm_request_threaded_irq(). These handlers are
> > normally released by device-managed cleanup after remove returns,
> > when the corresponding IRQ descriptors have already been removed.
> >
> > Consequently, free_irq() cannot find the IRQ descriptors and the
> > allocated struct irqaction objects are not freed. The associated
> > IRQ threads also cannot be stopped through the normal cleanup path.
> >
> > The probe error paths have a similar issue, as they destroy the IRQ
> > chip before the device-managed IRQ handlers are released.
> >
> > Remove the MFD child devices first, then explicitly free the
> > parent's READY and thermal IRQ handlers using devm_free_irq()
> > before removing the regmap IRQ chip.
> >
> > Also update the probe error paths to release successfully requested
> > IRQs before destroying their mappings.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: ab7edb149c75 ("mfd: twl6040: Convert to use regmap_irq")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/twl6040.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
> > index 562a0f939f6e..7b05d21cd17d 100644
> > --- a/drivers/mfd/twl6040.c
> > +++ b/drivers/mfd/twl6040.c
> > @@ -745,7 +745,7 @@ static int twl6040_probe(struct i2c_client *client)
> >                                       "twl6040_irq_th", twl6040);
> >       if (ret) {
> >               dev_err(twl6040->dev, "Thermal IRQ request failed: %d\n", ret);
> > -             goto readyirq_err;
> > +             goto thirq_err;
> >       }
> >
> >       /*
> > @@ -791,10 +791,14 @@ static int twl6040_probe(struct i2c_client *client)
> >       ret = mfd_add_devices(&client->dev, -1, twl6040->cells, children,
> >                             NULL, 0, NULL);
> >       if (ret)
> > -             goto readyirq_err;
> > +             goto mfd_err;
> >
> >       return 0;
> >
> > +mfd_err:
> > +     devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
> > +thirq_err:
> > +     devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
> >  readyirq_err:
> >       regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
> >  gpio_err:
> > @@ -809,9 +813,10 @@ static void twl6040_remove(struct i2c_client *client)
> >       if (twl6040->power_count)
> >               twl6040_power(twl6040, 0);
> >
> > -     regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
> > -
> >       mfd_remove_devices(&client->dev);
> > +     devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
> > +     devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
> > +     regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
>
> Why not use more devm_*() handlers?
>
> devm_regmap_add_irq_chip()
>
> devm_free* eeks me out.  The point of devm_*() is that it's managed.
>
> >       regulator_bulk_disable(TWL6040_NUM_SUPPLIES, twl6040->supplies);
> >  }
> > --
> > 2.43.0
> >
>
> --
> Lee Jones

Thanks for your suggestion. I'll look into using devm_*() APIs in v2.

Would you prefer that I submit the twl6040 and hi655x-pmic fixes as a
single patch series in v2, or separately?

Best regards,
Guangshuo Li
