Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565174;
	b=jelSmW6n+JslXrkEw+XtvfpjStFddosdfQVzcle3mlJEY2KBo+WbHYPg97Ib6Kbw8+o2
	 nR07VTRa/bK5IvhZmrgx+NNQoM373Hq9ZhdmntrsjlNEDE+9fHPdPdIhsKa9V1QU4rEbk
	 2furXjB1rTJaxTO1caUVyXmjyFetC9pMg9W3b5gCE3nXIXrc4gXdvirDlGstgWWxFn+5O
	 O6ZoOH8CBuJz2n2ldcKLujpyEQ5RjmrJA5iraszJps0NN+7rdWU4Gw1cadgmpFdSuIJHG
	 gB6AezmsVpIoF+KKT6mDC95Ahx7B9UptwC6QaCavlIYN+JDP9Ccpd9h6TC+OTgPpafA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
	b=JUiQvWm5DnnD6wmXY/LdvNc2AtIyFH4PdqYG4TYIq3a4sO4eoC3rTJTaku9SD20GIHkQ
	 cfnbKOFV8ra8EQjn9rLI9Lo2i1oEMtsyiEQix2kmjKEYvgKPqnrsqr2MONqNZFiUHyrC7
	 pYDKlAFULui36PRgVmGBk7w384SZ9aDAyJYboe7r5n//nc7QJqJqYvT5IGId28GoVQuQU
	 biAQbzcxzFkAcA3w3Y4YrayXLNF94MJ8v4uwXMMiyK81wX7+hc8uRTv3mtbyPaZKL/145
	 3t/NDDlerdpw3PLPCXsKAXGkSWCe5WOLmT/pjJegziYhn7NII/ODCVs1w/Jd0iJxiUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hcD5S+mc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA326606A31E
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA326606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hcD5S+mc
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9196d8543cbso3313386d6.1
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565173; cv=none;
        d=google.com; s=arc-20260327;
        b=mn+wY2e1VCUGzB5oVc6xqAVGlLkB+f2fWuq0K654BypC0qkR3yYDNN7GVvU85A5j1z
         /5jntyStlfTnFNoRc5M4dfzf+Y2vSXMqEK3tNOmmw8GOprYUNdXb5ucnIvhkjjEzCwq+
         RHKhdLvDCvX3Y3T2FHRBd1QNbgtpde1jPbRIfYyD5qAziRLMAkeNnHWpE17opRsbeScQ
         TeZDt72soVj8N+NtzbiTQcqaQDI3oDXXr2yGOoWt0SRN3q2pZUULp8G22VsnNbguUynu
         N4ri5CfSSrxAhAXhX0wTKlEZishcq/ORCLTXhtoTChhvR31J8vrZZZK0PrnS1vMOHA1o
         5lVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        fh=LUd2GBtAoTH3DuJG3mR2xbtG+++k5qUGIg/dNrhHm1c=;
        b=GZtysKcyBsHSAM8sapWc3Y+SiHgHu0bkCIVKZRhU3ly4NwOOmMaeFf2x2yV1+JINZw
         gyv3J/aTqIsbQLPC2azuDMfxmieAoB+H7gAhNnv3Goxc0uKrGJ0Hvlsu085j7ogg7cM4
         bm37hTJt6+D33NHr2WN1VjpQrTD/+XEyLKhfaILGwFvvcpQBkmt13bG1ml08bTMuKFiG
         ujwz/jHIG0MiBO+7xHGkG52ZOV8As8xMWFGkr7UltA3QbcrbyQUCGSNUMAB1KQMABeFW
         7po770+TWjAg6Ik42hX9QAI6+6+ZUDr61gKUWXj1UBtsVMnccAEczCC654+gBIfqFsI7
         PLDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565173; x=1793169973; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=hcD5S+mcjzIaNpHygz2s62Q8CPfsqyja/9KAs1KGzjDyvTUXb4RapIC3utxKuB4YR2
         +9KCuL9U3BjnKZ82ZyCB6eY5QorW250D6lraRWuoQMMSK0j4arGqGUrQI4OFST77zkyM
         QVnbTP1tyh/E+IgUiDYt+tnGIhJytpAe9KqZwlkpByC1YAPA9QBVWiwTntGhbA3v1aag
         51RYakGMKJPoLbzPkwffHrRbmPtqjOq4BiIK20+FDLUUJOeW6mx8d/0xjZBn3WkOiX2X
         rvSaggL0jQ2fr/9dOO77SQItTSX5OHBqu4ETl+570S97B71HjNrYFes5cUIv0bJ9GPNt
         3FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565173; x=1793169973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=22rzYR8d0S7Ui54obAhAp26Akx0ZktRiI9Z2nmn73qh9Cl3rzSpwdACb3c4qTXZVPP
         Zcjpy5chZD7p3ITDZZ6sIO+My5tf8aZ/7sLQ4qQ9pS8xbIYRYp2L/cEsWbppRmWtsP1P
         wzmtuh3sVg1HT5eR6P5CsN48lo7fRPGJkror6Nz715G3tJfX3QD8gA+DC5XjbO5kbTvt
         pGw6qaMQLUu3pOMO344IspxZY8N8GczZswtusRNr215VHqaGRMBcov8EoNYh3yOWe8EY
         XQMyLKONw26jVkMXJpYuyqJvPPBBtm1CNAJqKl/mqHJfimKUV5yPzpJ9LygejieXFQPE
         LtYw==
X-Forwarded-Encrypted: i=1; AKwUvBxZDpwPhWT9iyDvO5qOMFUo2sHgGt/b2Jau3htYADdnqz4M5vJdX6fgehP5Fd74Vx2W8OA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJac9uQkmwbMGkBQe+3MoCNA1e0eJ8ccJGCly5ZWr7UyK1n3JU3
	JWfP3R0YGeE3wPTZJGRPJ3tywTx2VfXVhVgG34ESJCWeaqG7LEjdNPStB35H97j22lRbkmtNWg0
	IbFTd202UzO6XfX7J/44j21c/Zj9Y1zk=
X-Gm-Gg: AYBFou1QR22yJhe5E1ajAqEdnwUy6sANrvXOmalDsDW62sSKc7anX4/G8Jn3x8Zfa6K
	2x/WiKu42n46X7nqfW/Zc4PP4viyi0K23MxLhsEcH98RhCsGRT4PAKRUaj29pf8ZRG64IBTe65D
	uEOCKLu3auYKQb+rCHI4vvs+WmC/xpBeV8EfuCxKlcIBSCqFMpDjchdpiGRaViBHZIYyWsOKX5L
	1z/62r2XR2bqyaXHKPdk88GhLKjz+xxBqeNnq4wBJM5bCDDlrzQLp/k2A0ZEi9xFWQCN2wCc2Xx
	HWyzJla4/DdW4Hv2c4fpEZxGlsIWn/1rXFVGn0NDd5lmzi3FpUw3bqyRZGpMeaJQ5BTcLs87sh6
	UcK7KZhuVYEKdfPoGlAykFKdNqcEmZS1+RV8/CQlarLPorFa8qdiVsgaqrzM=
X-Received: by 2002:a05:6214:487:b0:91b:cafe:58e2 with SMTP id
 6a1803df08f44-91c12eb7b30mr18765456d6.14.1792565172936; Tue, 20 Oct 2026
 23:46:12 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-6-a0282524688@gmail.com> <sashiko-outbox-169117@kernel.org>
In-Reply-To: <sashiko-outbox-169117@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:46:01 +0800
X-Gm-Features: AclHuK_sk3N3reGEV1vFqkhXmWhSRT0CO9e7SvF9FhuKig6lX9RUqvijqALmuJY
Message-ID: <CAOoeyxWNsBt6nDn82bCv0DUpar3c_K19su87UEbjm4CfCJbbHA@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] mfd: nct6694: Move module type macros to shared header
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, mfd@lists.linux.dev, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Vincent Mailhol <mailhol@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] mfd: driver-specific header modified in global include/linux/mfd/
> --
...
> > --- a/include/linux/mfd/nct6694.h
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -8,6 +8,15 @@
> >  #ifndef __MFD_NCT6694_H
> >  #define __MFD_NCT6694_H
> >
> > +#define NCT6694_HWMON_MOD    0x00
> > +#define NCT6694_PWM_MOD              0x01
> > +#define NCT6694_I2C_MOD              0x03
> > +#define NCT6694_CANFD_MOD    0x05
> > +#define NCT6694_WDT_MOD              0x07
> > +#define NCT6694_RTC_MOD              0x08
> > +#define NCT6694_RPT_MOD              0xFF
> > +#define NCT6694_GPIO_MOD     NCT6694_RPT_MOD
> > +
>
> [Severity: Low]
> Are these driver-specific module type macros only used by the parent and =
its
> immediate children?
>
> According to MFD subsystem guidelines, driver-specific header files shoul=
d not
> be placed in the global include/linux/mfd/ directory if they are only use=
d
> by the parent and its immediate children. They should be kept local to
> drivers/mfd/ instead.
>
> Does this addition of driver-specific macros to the global header violate
> the subsystem architecture guidelines?
>

The sub-device drivers under gpio, i2c, can, hwmon, rtc, watchdog and
pwm also use these definitions, so the header needs to stay in
include/linux/mfd/.
