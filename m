Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761906;
	b=laUGkxAJgjISnu+Dd9/coOCxoelX+S/DDXgJsEwMeM1LNoghOJbarwG6EWK5UKS2XgGP
	 /8pIOvc7zdrKcDO7pG0DJbU7P7sgBmvbbRUhHGg7DTp1oNuNiDQViNHi9CHjFobdC/V2Y
	 /qwMs1XNVfoieXYIwfuR/HqY4h9WQbkJjjvh8lxM5b0hkTULyc76qLo/AGiAbKfisw9+b
	 R2COC5/HNOnSYJkuGOZAyA+KqMxtmRfGTMzWRlHIeS1PwpXfwvScbQbVjHW75p0OmQOoQ
	 9DVGb839SAFm/ITs7IyHK0h4nAPYBLKxT/xBVptO7tD1EPPbL+NXcbdSaQqq1ThjFxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
	b=QPAGVZIu5jvfhmXYfFxAmMqaRACHhM0clAPiQo0BeatN7na4XV88l2fWfJO9TjzoN2GO
	 qaRk2XPOxgysS7l1bkx+CD6ZZdePC/ffN6EED9qGpUEXIZiugww+F5aA0idGQgDS3DXs1
	 GPdr8zUmiQa/7JMfeegOBWmUkGhQgh5ASPUrzJhcJaEy/9pSMCxA96f756Lic3ibTL1L9
	 /OICC7v+dT/4x3Vx08LL9cMz1xJdeb89++DHD6Ht+zEHjntSKUykJCoaSCkiSp4vpY8Zt
	 1A00hdSJUwYOvd4TArQzy9yMCJg2HFjoverHkFb8DCjq9SthAL4mJl27+ZQ0CBFKGjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FJ8k8QmV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E4D606A32E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 06:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E4D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FJ8k8QmV
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-921318b2eb8so95798036d6.1
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 22:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795761905; cv=none;
        d=google.com; s=arc-20260327;
        b=SjIw3tzseNDNPj5p7gOlDUNn6hAHlAY2nN2SPyfkv+ZLgcZp8nkWXHE/lgTXcwlTKe
         T4ljHttVcXqyrQSeDMdNq0ZLseGnP9RHHxd9a9CyRvLeJajgaSf2l/rdxNFBJb08wG0b
         +B1oF+V/hcPbik4wpXtp/3isUX9JeE17n5xwBLrulpWgAV24No6ycytEKG3WaVp0LG+A
         6S90tO+WVg3s0+Ika2WTFXD088adj68TXE0Ro5HcGjX1id+GZJ7GExNxZ98buH6j80AP
         OgTQrXoL/0eoeSVqKwcxx5vLF3WbiAyAq3SAF7So5v7Wy8dEceu8qxb/1Ww1eXoQYvLb
         GZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
        fh=1qhHlCMnYLy8+7zWaSK4UuR1UNyR+siNr44o9mHT528=;
        b=pLIn5iTktssiWiggEe8QOEv37blHPNsvXpxT7sa42Uq4EcYd3mN9yCg3VSFeRGOZBP
         jdjSXHRi3pFwAWaI5rQ2Uvr+UwK/+noVRl/LgRYyrp3XsfRBHfczpEvNDi0MdlagPcZC
         eV4nfktWX3tXPjSZjyWtA/+rr/a4WGPyIQZ31qmvnAzuUxqPxMGzoBtlC0SE/uwmzOV3
         Z8bltbBHDTYIDaeJ5cmaXrHdHMx5GuQJhCtMcEKSQnWVnHgEnNCyqjyEMkXe6rF9Q1Lw
         SfhzGlAwZ6ux5wPZTc68O32biPbdeiDSnwF1kwsP9C+RcN/Y6+ZCqSdBpNrs/bJ2C81r
         vfDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761905; x=1796366705; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
        b=FJ8k8QmVEyGxJkMnJmfPRknoJpVnNVbMQ/gM7+eRGI6UWS7FRiTvbJEG5AFA1XqHrc
         YaPBUnFK7s5WM07VIc1hvQKT6MfCvJ3vmLoVRB8+kY0//pnvcZZVZtffMxZvd3/RMfXd
         ij5NU41w9vmll/qIVs8Lf2PJi3Ju2mNfqxR63/5LOiJK5ELiKly1B/PK9/6HvvzTkla0
         DRf7N6z9hc/xeTtIp26fHrOWzxw0p8C6XVPbOSjmMn8hNu9BLAJfh+ezjq9NQhUqPDG5
         M4wuy0gOn0ofwKJTOVryx2rCih6Yl4M7ych939fFTb504yMnhcZcYa67QyYrc/feSdfR
         mZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761905; x=1796366705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
        b=cNj/ZIJkpwp091lD6W6ehSagHl5TaDyGz2fF8aKNs1hxdGNoViKCFOKSaDr3pIW9+M
         XOmqawzyp3HrySMl4rNfbCxSZw55w3dpYugNFILzdBcRKU0LPpl8FM04RAt4r+rJ59Ar
         uVIS/ovvEYG6x54rylswGll408kgHIvh4lgU2g5N7gTH96fy3lZn37HkQn4/arQJftp4
         D+Va86iuvLnU6mSv0KjPV8wLyVGSY2QQ9Fda8bvpfdNSPTOTYHTlzSyaqMYHUe2GBxzU
         ge1Q+ZhY0sA+8b6Y7tnDTVqzKYLm+ewex2KnkqkCxr3Rhlq7Esgzw50HByPRoR5xbLIA
         cgsw==
X-Forwarded-Encrypted: i=1; AL+hErH/6/c/Vu0Nosqnd/raEToAlC+FLakeLdORw6zwLRoxHjmNxXgJ7abruwi9ghHDs2S5uzA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ComufhDgr88QamrKoOtGSTstfeLPAkdpN/mrmdYGKevceIyPR
	0RkzNYeTLgaFL1yvYgLZF3PEMJwAOLhqU9l3MjAZQlL1YL6Fo04XhfuoLsWTIru5jc3GdwQE7ER
	1nPP/tXwwIluqNtj/Gx441rcN4shlvR0=
X-Gm-Gg: AZFdTZcBBK1AUcifTlXzRJf/AXGzT4twpWrisuxgAXyadNc5GQHWlH8aF/Yy+VTsOzn
	mbHIJB2vCELczonIVB538xS5d44edatk2T8MjPZw/Oh7VlAvhyU8VldoIN6OtsQl2lcSu8NsTFx
	iWEBhcEvAie7EGZRfu/i6PoiyQlmajKFj4jZbHPG00VKO3YFOP3b2+tocT7ymwYhMQCQiYztQDG
	i7OVXIAmd+nW2/wMtAm0Mb4Evds+V8ZOViT2HtyxZUoIq4H3fszCpSCxdNJwjapN+loiE8MQoLm
	5rSpXqZXjdZTNe8V2Q2yqEmiaVDqUC5HZZYqAMUCZjNihJdp2Mf0+cgBwwnVcN+7JM/yftJNY6j
	M6xHfM4cGqTQRq0fx5ct0YpNS3L3ytjzPqtUdAg==
X-Received: by 2002:a05:6214:4301:b0:921:7897:493f with SMTP id
 6a1803df08f44-92178974c30mr138520786d6.20.1795761905265; Thu, 26 Nov 2026
 22:45:05 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-14-a0282524688@gmail.com> <20261126195807.GM38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126195807.GM38590@joneslee-macbookpro.roam.internal>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 27 Nov 2026 14:44:54 +0800
X-Gm-Features: Aa3M54rbQdVPmfUViaexDIoLl4Z3254v8UG0DklTTqBCSLcNT7OWxr5vcfysYN4
Message-ID: <CAOoeyxUKeXh0Npa67X-R39S2oFiBL3uKW7+4DXEAf7SsQVLU6A@mail.gmail.com>
Subject: Re: [PATCH v10 13/13] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
To: Lee Jones <lee@kernel.org>
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Thank you for reviewing.

Lee Jones <lee@kernel.org> =E6=96=BC 2026=E5=B9=B411=E6=9C=8827=E6=97=A5=E9=
=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=883:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > +#include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/irq.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/unaligned.h>
> > +
> > +#define DRVNAME "nct6694-hif"
>
> Don't define strings like this.  Use them in-place.
>

Will fix in v11.

> > +#define NCT6694_POLL_INTERVAL_US     10
> > +#define NCT6694_POLL_TIMEOUT_US              10000
> > +
> > +/*
> > + * Super-I/O registers
> > + */
>
> ... and this is a multi-line comment, because?
>

Will fix in v11.

> > +#define SIO_REG_LDSEL                0x07    /* Logical device select =
*/
> > +#define SIO_REG_DEVID                0x20    /* Device ID (2 bytes) */
> > +#define SIO_REG_LD_SHM               0x0F    /* Logical device shared =
memory control */
...
> > +static const char * const nct6694_chip_names[] =3D {
> > +     [NCT6694B] =3D "NCT6694B",
> > +     [NCT6694D] =3D "NCT6694D",
> > +};
>
> Remove this.
>

Will fix in v11.

> > +/*
> > + * Super-I/O functions.
> > + */
>
> Isn't this obvious by the nomenclature?
>

Will fix in v11.

> > +static inline int superio_enter(struct nct6694_sio_data *sio_data)
> > +{
> > +     int ioreg =3D sio_data->sioreg;
> > +
> > +     /*
> > +      * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
> > +      */
> > +     if (!request_muxed_region(ioreg, 2, DRVNAME))
> > +             return -EBUSY;
> > +
> > +     outb(SIO_REG_UNLOCK_KEY, ioreg);
> > +     outb(SIO_REG_UNLOCK_KEY, ioreg);
>
> How does this work then?  Is this self-incrementing?
>

No, both writes go to the index port. The chip only enters
configuration mode after 0x87 is written twice, the same as in
nct6775-platform.c.

> > +
> > +     return 0;
> > +}
> > +
> > +static inline void superio_exit(struct nct6694_sio_data *sio_data)
> > +{
> > +     int ioreg =3D sio_data->sioreg;
> > +
> > +     outb(SIO_REG_LOCK_KEY, ioreg);
>
> Remind me, why aren't we using regmap?
>

The Super-I/O ports are shared with other drivers, so each access has
to be wrapped in request_muxed_region() and the enter/exit sequence.
That's why I followed the existing Super-I/O drivers, e.g.
nct6775-platform.c, nct6683.c, w83627ehf.c, it87.c, gpio-f7188x.c and
w83627hf_wdt.c.

If you'd still prefer regmap here, I'm happy to rework it.

> > +     release_region(ioreg, 2);
> > +}
> > +
...
> > +     sio_data =3D devm_kzalloc_obj(dev, *sio_data);
> > +     if (!sio_data)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(sio_addrs); i++) {
>
> for (int i =3D 0; ...
>

Will fix in v11.

> > +             if (!nct6694_sio_find(sio_data, sio_addrs[i]))
> > +                     break;
> > +     }
> > +     if (i =3D=3D ARRAY_SIZE(sio_addrs))
> > +             return -ENODEV;
> > +
> > +     dev_dbg(dev, "Found %s at %#x\n", nct6694_chip_names[sio_data->ch=
ip], sio_data->sioreg);
>
> Remove debug prints from production code.
>

Will fix in v11.

> > +     hif_data =3D devm_kzalloc_obj(dev, *hif_data);
> > +     if (!hif_data)
> > +             return -ENOMEM;
> > +
...

Thanks,
Ming
