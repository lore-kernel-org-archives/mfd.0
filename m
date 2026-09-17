Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5530E3CB57B
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669999; cv=pass; b=AlCS1WbrKKYaat/gGYiAi7fPtj1AJM5ml2qq4lArkE5H6reLU1Y9aFNG5m9IY0LWGg9MTezRKkSWONDKAvJ6g2m4HWDwf5/XXDnrJUHWtpaN1utlGQtzkuokanOcOjAWllfewJzUZBQ0DM5saJmDyqIaquZL63hy5jt4mJGWJxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669999; c=relaxed/simple;
	bh=Z0mdvsxuTksnVj1s16xXhW0wn2tIEeKz/5P4yoMDNVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDZvowZHSUWqI0TfNchQY1grlqOiXLM6cDUR73u5W96AyTRdp/yw1rCkPeEiywoVdbrKfhe/cwvf3uLUgcV5usQFuAC0HpMLgNxa5DhEP15cSfoX8vkkpS6ZxqE5vVA9bCqwgwiCI3W5gCQhX8OrDToxFW7XG2Ie9OzG6VWo2DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDgWCuQL; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDgWCuQL"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so204116666b.0
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 11:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669996; cv=none;
        d=google.com; s=arc-20260327;
        b=OEikyMAzEvKqGdAmwYjl9577DnjtfmmOO7DR70kxdIPBC68NXFH5hPkp2KKPxduaO2
         6JW8qDW+bfz5vY0zlHkenhjndkT6PkY7zPuhJpHbwWk+4oqxg3xcoW3Nr1/9jToZfEBP
         AU3wtM/irNZnIPJpYpF+TYu6wiIlA0Pvi4uut6qMXQ+ExIog0eIbmY3Qqw3rbwsgvX4s
         zJc5CVc2GFRfG0CxzoPLmkk3FwPG9CTA41TvC3l3aDwUCqPQDfp+Ag9F2SnofYod15KL
         Kpa27/cjVmyKeKyem0JGKyJ0xNRVimu9eKrXwREc6qBjFq92Txasj6uvZstKxgl0UahO
         PBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RAtHZMv4Fp/A6jZu1D8NUV7UjBzzzb65ZEkPo8MNyj4=;
        fh=+/aJ3ZhAtt/B7FiKFjOU2OHctcN9UpzN2eDdbkfJA2U=;
        b=HD+JEJk94iSQSE5kyoE3LoSUrAqMtDXiheND+QhnpF3ct08AEWVDdZ2ZBJdh1RZ1OR
         zL5Qfjw9LncWwxqfPRtJn7oMkTnLKJaHL+oCY2JUAh72voFfsNfC9v4MmzuKccx8OElC
         Ae+qEGUb0KtJhVns0JRksX2zmTvrO3AKuVRUEAr5j68wHtyglQ/KsSyS0iidmbkOCx8N
         uDtcj+r7DwKwnKv3SWAxlVBaDH+erSQntXev87SUTTs8M3Tx9Jrb062ZvsfrBaERVaa4
         yyVVZqoSbBDL1zyxtDO2iULVGyzmVcgqDiShB5/ypoAF1nbDHXdZAHUUHiNLyAqAE/PA
         I6ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669996; x=1790274796; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAtHZMv4Fp/A6jZu1D8NUV7UjBzzzb65ZEkPo8MNyj4=;
        b=dDgWCuQLJwVGtgXFs4uIxG34JQ7u77J0P6CZoxM0a13QBGvXceDthKuSGFPOWjnd8z
         IjLzqiRmPCPZVk0Ch45OIrzGkmnemES+rBPQFv/JeeFKcVIFIyyXlwM5MtDOvHQoNwo1
         wcLqNFLP8B0/StnZj5vu9/zrbNfU701WQKZQXGTVdBUU0HTr2twOjsfbCj9DYU7zoyc5
         6MMQXjGN3c4PWR+y4FVJAmxzNySUhVEeHQtnNr6bCydvmYdefkcTde7kaGW/CRxJ5TjX
         Ew5NcqG9H2tpG+WsMW1h9v/Vp5wdPuqoEjywGEiLmhN/iGvqfpZ4IJXYo0ui/bu5DIGI
         8kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669996; x=1790274796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAtHZMv4Fp/A6jZu1D8NUV7UjBzzzb65ZEkPo8MNyj4=;
        b=NVs1hfpoRnKGt7WwRgFq/wx4CSf/L6G0o9+wABsMHjy2zN9jbT0ir+IyOPLkxzhYv6
         qAfWVI84ZuoOd9h9IEUr/yjVhmnmXgQo1rOtOqgU+2npZKWysM1MmDiog3FbY9t7dydi
         I5Bjsf4YvtnzgxxOEy0pvgvBeOPqJWA4RsLycsIbov3We7p+424uCqMn5+8ZdvXEf3Z4
         fKOGFWHNmymFQmRmehgwVi98PiFPiSoriYE9OQ4ihA2geU5C8kUxzeujmTXjGztb3VI3
         ekbedn/EKHIvs+EZJJHQdAfWEIb3wVZbYusApR1guyJWRi1G0sxLXXQpLXcudcDBBBfy
         mmvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/Z9r6NWVek946pvHy1zDc0PXffTQl4X2idvQl/J2j0rVEKJrmdaP6RE9+CnEJbbcELec=@lists.linux.dev
X-Gm-Message-State: AFuF++nIXltWu5ZlKYjgH7DbkTXdnMmXOJ7UhMYJu8p0o9vkb9i5WEaA
	iV1PnrWlHZfhJJ2mLyHo6giW763U2hQeJ+JvuWMqSK8dXNu2XIrc8QJ43o9GF2qiKmeX9il7fyN
	efaz5oaGevH1Y33iN1uBdGn72V/Rn7g==
X-Gm-Gg: AYBFou1YuK6+ggQWrQBWPB5dADnofAbuXbRcMWo67p1kalKEfpgkIsNwqlIp+2OW1FD
	1Qe+5FL2AMfv8X4svI/cuxwetjWXE/+6trSSL5iG+m/Ui2KNxwt8KyCd3mXIEyBLnw8jynQVoa/
	RjlD1d+Rh8Ou/0WvZMs7zgbIvKrBxdj7GpnJDUoNlxYX18zkWlstc51abifeZydLryy3PpCoxBC
	mi7Tz4dtBXR4QrS4d7jPOXBHLKevmJTSodaS60Q7v9If0ea4Gb7HGWrakrs4t+GbN53PXsM6t7u
	rBtTEeuomeD3GNnq7osNSa04JgNrL9dAoN96QNS89aRjBVWPiyRjPotzmm5DJ54hVPlScGrU1wU
	xEGjIR69Z5mPdAHHjDyEq6fe0Sc60ZvukixYEw380g+vMEg2kAGndma2nKSESR35MzTYI
X-Received: by 2002:a17:906:9c84:b0:c25:8fdf:5d with SMTP id
 a640c23a62f3a-c2a15685169mr7747666b.13.1789669996402; Thu, 17 Sep 2026
 11:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGEsz8F1hk5UpR0tJ6LjnbTKTyfKAxu6E9=7TLM_ABgodF9TdQ@mail.gmail.com>
 <aqj-zOf7VhWlGqg3@ashevche-desk.local>
In-Reply-To: <aqj-zOf7VhWlGqg3@ashevche-desk.local>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 14:33:04 -0400
X-Gm-Features: AcwNN1Uomklmj5nh7O87baQcN6DxKDiyYePx3EGmO-GgU6xPrW2O450usLTp77Y
Message-ID: <CAGEsz8EL-cWXTexpcBHF3=mYLnebwE7ESEJ59+p3VnGf02YLNw@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,

Thanks for the feedback. I=E2=80=99ll use non-devm wake handling and drop t=
he
shutdown changes in v3.

Best regards,
Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 4:16, A=
ndy Shevchenko <andriy.shevchenko@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Mon, Sep 14, 2026 at 03:18:51PM -0700, Myeonghun Pak wrote:
> > The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> > after registering its regmap IRQ chip.  When that succeeds, a later
> > mfd_add_devices() failure or driver removal leaves the wake enable
> > unbalanced.  Shutdown only disables IRQ handling, leaving IRQ wake enab=
led.
> >
> > Register a managed action only after enable_irq_wake() succeeds.  Since
> > the action is registered after the managed regmap IRQ chip, reverse dev=
res
> > order disables IRQ wake before tearing down the IRQ chip.  Keep warning=
 and
> > continuing when enable_irq_wake() itself fails.
>
> > Shutdown does not release managed resources, so explicitly release the
> > wake-disable action there if it was registered.  This also removes the
> > action, preventing a second disable during subsequent managed cleanup.
>
> Why? If it goes to shutdown, cleaning resources makes a little sense, no?
>
> > This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> > variants using the INT33FD ACPI ID.
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
>
> ...
>
> > static void crystal_cove_shutdown(struct i2c_client *i2c)
> >  {
> >       struct intel_soc_pmic *pmic =3D i2c_get_clientdata(i2c);
> >
> > +     if (devm_is_action_added(&i2c->dev, crystal_cove_disable_irq_wake=
, pmic))
> > +             devm_release_action(&i2c->dev, crystal_cove_disable_irq_w=
ake, pmic);
>
> Is it legit to call devm at this point? When is .shutdown() called and wh=
at are
> the assumptions before and after for a certain device?
>
> >       disable_irq(pmic->irq);
>
> This looks a bit ugly. Can we start with no-devm? This will solve the abo=
ve
> question as well.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
