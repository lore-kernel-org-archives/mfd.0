Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D379F379EDA
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 06:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020284; cv=pass; b=N629+J2IvhMrtGVOcuXjkWR9yudgPBLmZZePLP/qBHlJXOsJI9WVucd4SVXSla8HHmINQC+1lrFZjcNc7qbax/ZZXJnI3vYadfxN3cPmoNwOFTII9tszPfwMzb7vz1gfmi3G4hni0XsK1IDqZMbRNySgRMNGbZrKQcCrCwkqILI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020284; c=relaxed/simple;
	bh=Y6b96iet9s2KwwRC14nzYS35sZ+CgS6dHidY71VhHFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odbv5OkggL6RCfTLP9FZwa62y//udxxZa1REFMyCiMZQXFKJGLBdhC6rTVQeR9fttPNSHbbysqC7Q44farELpRyxrbTV2UTmecTJEWkiRWp/MZJIN+UqmU4ycpj6e2T87WIREan3u8oAtrXGPI84OlTRfV7O7M/IiUx049DYkGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kspa5MmG; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kspa5MmG"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9309d4ea213so732427185a.1
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 23:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789020282; cv=none;
        d=google.com; s=arc-20260327;
        b=cBLVaYS2Lc8A1JSwmMWM1y4k8eOpABHF8lBGZPp/1LgenUW0oquvqBCncRkCJbwG9O
         /8IysItsRok4nwhA23/hHQBzQd0FP8kqHg/ZNaC08BBV31I4CwGgysLD7LQdkJ1WHmRD
         QXRfh6Txc/rXCur1ddmb7e86Sof2U5tUmGAy9GKPlc5Y2PMnFwloCtz8ILgCCOtnvv5x
         WuASBdAw/xSn6r0Of4epPzJQ5m9arKyfAnAK2VNzu8mtXr5k4vpXm7sHkx6WHQLW9zzn
         nh8HpXTJznmQkWRF2KmG782Is5KaQsefucWib0qK1dAdHEpyhxMmdCIKLTuAk+IYfL0B
         lbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nBNYr0evCGRWWAC1VfILVSzC5WtT6AbMNuwOI5qjq5M=;
        fh=diDOTdROKGwQnAeAXyhUwDN+0bBO9AG8IQd4B4vTca4=;
        b=nbmaEx+pNuxc6bq1vbEOvU+zMuFKu8z6nc1JAkccIife8DN4UmXJs393Sz/HAcY4rp
         1HCeNlfn6cjHCJUbMLRctj7M9lclc+Wl6rN8FQ77+wVQmML+YpRXUc5YawmJnNYuX79y
         TGirx2aJC1rcM2xfCN2bhENjtGDNG3EFTJ28U6rRcBTaGY8XxgE4yhBlXClYNYa57dDH
         OMtBv3JsrvYFIVgsBcGlVanoRuslCZY7FYnrpHu+4mrmWagHqNJu4eyLrLQAJkLdTuaK
         f4kQ6PnJ9gwhOVqrBDaWEm4I20RmenK+OWhYBYpd5Qvwf29oU2HBUp3pXQrG4ZpUuJ6K
         utag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789020282; x=1789625082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nBNYr0evCGRWWAC1VfILVSzC5WtT6AbMNuwOI5qjq5M=;
        b=Kspa5MmG5YW8z9oU6g8/9r/kypys5TZXeR+0CLvjHJeL+loYKLya2M/80/DGQGDYhN
         aV1p+U9LlkGIp82rD6lDPk6xMUkFE8oPCKO/HuYRGpvcymwj734hJpMuFV6b0OQwCRwW
         QnwxZG4DV7A8DyNvzJFI+gxsBkRCOFjKjLnJlrwgY38E6pIRvxHNtWwqqrTXkq/uMBH6
         sSrhgdOMux0z5jMmMtuIuVqhkxmhJVes04HR1fn4t912j20lLam9TMt56zPcTbvHj8nJ
         eAbrauFe2yi83cWhxion43l0UucftADfFlRns/pMzcTXvIaWPax9Oyze4N2locFbVG+Z
         djDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789020282; x=1789625082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBNYr0evCGRWWAC1VfILVSzC5WtT6AbMNuwOI5qjq5M=;
        b=BgwVcgIgcODS/lZJP5bCr/V2baOg2hm8B/SUj4nSZ65OpVYqoUDfGhJakNzlCQfZ0j
         hLL623mP9iwmQYEUX8ZxhDAo6ysxdnVxnd2vLJRpAfmeMUqFOk74eHufxRjn/U8jnjL9
         AUU67GzODWCx/OxjlbsKoiHglI6toUq2aYmn/fS9XELQ1bF+JNT20PfYeF09FKjfi2Ht
         x85s9wxhaVlI/BZV14SYCIfsjR8jO7jtb3zzxAslOPiFDI4R16CFYtonlgfawHU+0Ia4
         /ubQnqj5xlDJsdiWnZkKPZAevxZz1seYAY2NRYVfi9nT4zrPWQCb20Vrcshqwhm/DIeh
         b8Rw==
X-Forwarded-Encrypted: i=1; AKwUvBw8zNBUj7PdkjAFa3Y+/E1wdH2SWOLSqD8kXAgY1OQsLwL/5uRvYDlJjucZ6m2l5HFNTec=@lists.linux.dev
X-Gm-Message-State: AFuF++mhrvjf/PrXRaXciPORpQUgLczwDvLeJtMbcUewCRlKnGBQThdz
	5ElAdOReLNsP+6znnUHK7g18CFuTpI//1xR+pGvlNAjzndayAL2ZxNmrMI/58VtxdMdyGgpjNIS
	1cZT6bqzayiopJDJ5cNkMbzm58fx3iWI=
X-Gm-Gg: AYBFou1K4D3Ef6IpiXc5GhRGyQF9O1paRiOFJOB91U2yr+kz/0YyuHzyRS7ZoZb0BRt
	WJ287x4ksCdy3FN+K4BVFf1IdtLuMtmPnf01uOsCqU8R2ul9CPsmHkG5H6Vm8Bv/vZ6VIN1begR
	0c3y4Ll3Oc93jSNF2OokF1Ef3FkjvdDssynjVIaWYue8BgpmvOkAEA3nmP/XFYGcalAoTJ2UAjr
	xfgmzyVAsR+fDPQS96MYPSPacEmq4+DqvwZz3BIV91ctMI9d7IgOIUBZU8AfoCv5vUOARiLQi2n
	+f5JEJOjqgxHa8bdS2+0To5aIVrnXnU23p6USpQb5gK1SZmm5Oj+4BUU
X-Received: by 2002:a05:620a:4443:b0:92e:5d44:73fc with SMTP id
 af79cd13be357-939805cd179mr4210849585a.12.1789020281612; Wed, 09 Sep 2026
 23:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-5-a0282524688@gmail.com> <20260903102447.GL2133376@google.com>
In-Reply-To: <20260903102447.GL2133376@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 10 Sep 2026 14:04:28 +0800
X-Gm-Features: AcwNN1VdtjlRW6XgLdxAdHaEJGhXj6u2d43oLgez_0YxgAUHTZ1OoGurmEs-fpU
Message-ID: <CAOoeyxX8Tmk0qaWHz+xJoUZgGZbrqhcWQnGYbTEPoCWC2bOcdw@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] mfd: nct6694: Rename driver to nct6694-usb and
 update Kconfig
To: Lee Jones <lee@kernel.org>
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Thank you for reviewing.

Lee Jones <lee@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=883=E6=97=A5=E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 21 Aug 2026, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > Rename nct6694.c to nct6694-usb.c to accurately reflect that it
> > implements the USB transport backend.
> >
> > Additionally, introduce a new MFD_NCT6694_USB Kconfig option and conver=
t
> > the existing MFD_NCT6694 into a hidden core symbol. The core symbol is
> > now automatically selected by the transport drivers.
> >
> > This Kconfig and naming restructure aligns with standard MFD transport
> > abstraction practices, paving the way for future interfaces (e.g., HIF)
> > to be seamlessly integrated.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
> > Changes in v7:
>
> No changes or you forgot to populate it?
>

There is no functional change in v7 for this patch; I'll mark it
explicitly as "No changes." in v8.

> > Changes in v6:
>
...
> > --- "a/drivers/mfd/Kconfig"
> > +++ "b/drivers/mfd/Kconfig"
> > @@ -1164,19 +1164,30 @@ config MFD_MENF21BMC
> >         will be called menf21bmc.
> >
> >  config MFD_NCT6694
>
> So what does this do now?
>
> Will there be another core symbol soon?
>

MFD_NCT6694 is now a hidden symbol that builds only the
transport-agnostic core (nct6694-core.o, added in 5/10): the IRQ
domain, IDA pools and MFD sub-device registration shared by every
backend. It has no prompt because it is not useful on its own, so it
is  selected automatically by whichever transport driver is enabled.

There won't be a second core symbol. The next addition is another
*transport*, MFD_NCT6694_HIF (eSPI, 10/10), which likewise selects
MFD_NCT6694. So the final shape is a single shared core selected by
one  or more transports:
    MFD_NCT6694 (hidden core)                 -> nct6694-core.o
        ^ select
    MFD_NCT6694_USB (USB transport)    -> nct6694-usb.o
    MFD_NCT6694_HIF (eSPI transport)     -> nct6694-hif.o   [10/10]

I'll clarify this in the commit message for v8.

> > -     tristate "Nuvoton NCT6694 support"
> > +     tristate
> >       select MFD_CORE
> > +     help
> > +       Core MFD support for the Nuvoton NCT6694 peripheral expander.
> > +       This provides the common APIs and shared structures used by all
> > +       interfaces (USB, HIF) to access the NCT6694 hardware features
> > +       such as GPIO, I2C, CAN-FD, Watchdog, ADC, PWM, and RTC.
> > +
...
>
> --
> Lee Jones

Thanks,
Ming
