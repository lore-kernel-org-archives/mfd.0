Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9A9411661
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 22:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424223; cv=pass; b=EycHOHcnKiEzcrvRQMgPI4sMDY8Q5i9t/ybp9o/MUmjVtpAGlXDl+fA7Sn95KM1T1euvCglWj7hPAUiNAm/wEtYHMqCE6uLyWeW9WT82Vr0i7RgV41jW9AuLu6Mp1MNOt4Rb0TXVU3Bc1fuxDDO326yhLhsVEwPly1/YRIJ7088=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424223; c=relaxed/simple;
	bh=F26XusL349fj/POvj6KSDmCxhPlIXdg95qDIGU2tpFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIU9LDCaKYelpG+afLr0D5I7N/iMLICOwunecd2fla4n+nRoI1rPLx1R9Nw4RCzfhyTf0XdAAwlks8Lx+4iFX0IP2EATqhV+1VX58N+DDQi7pvs+Ppy47ScaZBcc2HXrFKMCJcqDnytioJsoQIv6jJzrX8rcvoTKm3NrEH64Wc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHyZ2c+i; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHyZ2c+i"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so3297293a12.3
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789424220; cv=none;
        d=google.com; s=arc-20260327;
        b=eExJJoXh76kFy4vsZAgT6+yady5d8T+2OqZqa3A9LKD/+64tVt/ubDrlQapKrApz7f
         NpgVYcTfqVsD6OIf/CWRTAaRCyX0ZXCPFY+7DoE7jKhDFUh351NujuPUUu8LjOg5TPQw
         mMNLjcaJsCr+AhweKrRvRcUoVAZMetTPSr3EZdZU2ev5VsETSZ+OvbrMXWkKeXLWKVsI
         1qNT2rFlR7a1y6aKN9cjUbWgI+YGEf+3R0tdaXg51GgVLwweUmNzHo+iIPR9fIXyNbZy
         syM8QF8CwTuL9gK6CoYsBj2slrRsmHD3Q2riXkNcu2WU9bFtfinbhwYH0fwZSyiQjk+d
         uwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5811usFaNJpGkrxjrcQnbMmTE8twHwPG+c7GaruR6FI=;
        fh=kwLeYgx5kyJQC0gN0b6xHJPMLlCKG5P/cOmsK4dhUxo=;
        b=Zexc8alp84zmGLUd1yjl1JFA2pRNTU69hFkPIaL8kWujwx/VmfU7MdsNdQwxxDbzk9
         YHxUe4tfULWVM6RgbSOlEqXg6qKYrVMzNxlcFrpyNrGu6jphI5mDiuwmHyR0W1XVIEOZ
         7fL79b+vbusVjgJPl9C8PQ1HCyNouHPp+deCWnvSTV+Y3w5MjxCkHrghperMzrn9ZVrE
         vVcvFHLdcBg6cx7iN7+aNNsIsXkkuMf4NRkfxd4DUUVoWiKtZkeYA1x8CyL+QLdrTx06
         /s/qDICZvawzS3aLD4UsFEqYVqltGFt4bV1AUS8iSvuV0hjUxCU0dlohYnssRX/yLhxc
         5+AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789424220; x=1790029020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5811usFaNJpGkrxjrcQnbMmTE8twHwPG+c7GaruR6FI=;
        b=aHyZ2c+ixf2eCY+O5OJQHTSoARQazgJHCixg0sU0Jxz1XrqO688ur83URv9XNG/3fp
         LOHwIpA3nQQ7eDjIo+ZwiXBzQ9+rLRBEaVI3LbqsE6gLsAXPh5DjcZZT4eCgkA4SXsm/
         AMmkX9khRaA6QBhaIjOPqbsCZhUtsmFaTJOkgA8ZO3eqcPNQMIlrDsouZI2psZbFlKta
         rkcjAJOWVMA50GU01ZoNjUzEwAAyVI2oR4jSzI5wKrvdOcMV5hu4CHzJqBgwrPIFaz3f
         bftzzxuU5h6a05+ELXXLDkn/bjiLlQW71sQVTE2UV1dguZAEzYpkeIRLcH6NRkU5L2lt
         xrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789424220; x=1790029020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5811usFaNJpGkrxjrcQnbMmTE8twHwPG+c7GaruR6FI=;
        b=fwkLugl/VpCdC+qU7waYrDs+NsQ5JrcktHM8FlOr9/okgUlZpXSNHzKlyMO4Awam/G
         d6nikFhHBcwacl6YeX4olKyj+b3Qn7MiFYA/w8ESB+fYYyQTKyvlGOZHWCoq7FC36GkG
         /ZyYyvgD7ciXn1kxYiMBU8jo70rOD67sq6DZ5cWxDKaBlTNh+gtTGYWwWOTQfoyvXwZ5
         Fedh6gI4OQ5qKnn4kQjOakwd3crJmUslr2tSEOSaDvII7ULB+oWC0xTQclZIKiQxI/44
         erZJq3HXcAo2/KzAVeBQNITFc/IzCP0Es/Po+YYR3BetlAjkYrNOtje+1Mv0JkJPZynH
         +v4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0NBXBRYxVpekVX+NNgCfJr3rdCTu4FbiivVkKg5dV/VdC2t355zzC9aaHENNMg6wNVLc=@lists.linux.dev
X-Gm-Message-State: AFuF++khk8V5qDkUTo72xES7URtvQCT6VfcvJXUprqvfoSFFABqGhMCL
	cB+a1WIIUbLsgQnOIhLVYpTU9AEX7hdUYb9NyBdD0iJ5D7GBp77QUufVy7E/uth7Zg8pNfYpIIJ
	1L+0ybfbhyqDvMs6pSGZ+9gV25wcOlQ==
X-Gm-Gg: AYBFou06JUIDrIO8+C806d8PQ9ypiKBmr9foN9o4OEluV32ueWr7BNH8AyMkYBZB5vO
	NIESGABvSqKq5P2EXQHNl/Q1l043ZKZPzxYWWx2pFJh/6wFwgrBIt3Navvb0bEdejb9TXhVgJXC
	dosyChBRCliKUZYmHN8BEfX1S0d3b5ButdhkAjonbxzJcsXwcWALJVHlHcqve9kphypcCK3BQ47
	0SLy+wCGi+VNX4p4vVVffFb6nYFPLPutdwPZJazvPzupAfKIul24QzOFUXSijvrVBsFHPAKiPA9
	fLkPmJZVKWXEsuA3DRyTX3s51pYpuNc0d60nxYR05pthuzqCtig1LfZkmkG85wSwkYxfcYhME9n
	WxKyBT10XmrPpB9Wo7xrUOFBG5K0/+P5hpEPJi9rvMBQc3zrYm5UjhXUgt1zr/ltmFmW2Uw==
X-Received: by 2002:a05:6402:2350:b0:6a9:b51c:9d49 with SMTP id
 4fb4d7f45d1cf-6a9f623840bmr2755096a12.10.1789424219581; Mon, 14 Sep 2026
 15:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913013615.22615-1-mhun512@gmail.com> <aqexMdHnHHq_l0Y3@ashevche-desk.local>
In-Reply-To: <aqexMdHnHHq_l0Y3@ashevche-desk.local>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 18:16:47 -0400
X-Gm-Features: AcwNN1Wfuc2widyYkZuQibIG_V-Tt3xzJgrCwnfkF6XrA53w0ESfy3a1GYYfxJs
Message-ID: <CAGEsz8GnHrwmmU9-mLcj8gita4Gh+fBinyV=1WsXzj6TRvCN1g@mail.gmail.com>
Subject: Re: [PATCH] mfd: intel_soc_pmic_crc: balance IRQ wake enable
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,

Thanks for the review. I'll address these in v2, including releasing
the wake-disable action at shutdown only if it was registered.

Best regards,
Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 4:32, A=
ndy Shevchenko <andriy.shevchenko@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Sat, Sep 12, 2026 at 09:36:15PM -0400, Myeonghun Pak wrote:
> > The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> > after registering its regmap IRQ chip.  When that succeeds, a later
> > mfd_add_devices() failure or driver removal leaves the wake enable
> > unbalanced.
> >
> > Register a managed action only after enable_irq_wake() succeeds.  Since
> > the action is registered after the managed regmap IRQ chip, reverse dev=
res
> > order disables IRQ wake before tearing down the IRQ chip.  Keep warning=
 and
> > continuing when enable_irq_wake() itself fails.
> >
> > This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> > variants using the INT33FD ACPI ID.
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
>
> ...
>
> > Assisted-by: OpenAI:GPT-5.6
>
> Assisted-by: LLM
>
> ...
>
> >       ret =3D enable_irq_wake(pmic->irq);
> > -     if (ret)
> > +     if (ret) {
> >               dev_warn(dev, "Can't enable IRQ as wake source: %d\n", re=
t);
> > +     } else {
> > +             ret =3D devm_add_action_or_reset(dev,
> > +                                            crystal_cove_disable_irq_w=
ake, pmic);
>
> Make it a single line.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
>
>
> Shouldn't disable_irq_wake() be called at .shutdown() as well?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
