Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2931F98D;
	Sun, 27 Sep 2026 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525243; cv=none; b=k72F5GLnXryih0IFjWDQIQroXr2demgjDGVBTUssk5kzhTQ2zE590vET/5rIpLhDhsHYRuASMSARerrZwpzwA6dj5eb+GY3CZeqwVmwWQ0nxiEKSRmz6xuNBERvQZRQ2LOWibsriEWtpk05lk++OYUuWbzboNLocve+kcRisSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525243; c=relaxed/simple;
	bh=gNR2oNcBOZ4ZavM+PNMcKGSVaiA8/yL1uRsf4W2gTZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m28+al/H0DYKaBeTyeQLfGJUhWIhG/2MfB7NPx9VJh0uksXoDMESDR99JN89sYOFRBHeh/C79fJaSKe6bEnGdTNV560fuLzrEksxnR212yCmq6EUBRAkzOgGWbJW+9RnaKkJiSBYoHwdydP7Xnt9AC/yhMadcBxOQwBwY9eP9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xsl+yDyQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xsl+yDyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34521F00893;
	Sun, 27 Sep 2026 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790525242;
	bh=N4TZ5aIz7xBlwXcsESJ+UFf6NWAYflwhsSeNWHtoSTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xsl+yDyQ3ISpiKiigBEbBhylznS9tAQeADrugm+DunUoHFV5jD17W15GBoz03Bsla
	 gmvcwMWIrZ7F3LE3yJjCLP7rzNAAEvBA2IcOo/taceUBRr2QFuGs51LS24fZR3D3lI
	 8QkR7SAQ5e5ZJP2qxx49B3Wf5IjnJXPnopPWRDCpZ64FmJGL+HHR1mJDkam+akXgAe
	 0n/tGukVjq4Udi+bInWTuu3B3FvPpKa+rKMJFJ8EXyVWIB/uHTUzK1gsXm+cS+f6le
	 pRag97ZTeunq5KQ7sgCrIrqm4FlKIeFz52zkwRzfJPB2Iqj/osd2jqQwBWjm6Lt4nF
	 xT3fynvB6HN4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] mfd: max8907: Convert to use device managed
 poweroff handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260927155745.187758-4-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
 <20260927155745.187758-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 16:07:21 +0000
Message-Id: <20260927160721.C34521F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: max8907 sys-off handler returns raw error code halting noti=
fier chain
--

commit 42fddb54f9db77c2dde889b0a3e0f261fd20ec9b
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Convert to use device managed poweroff handler

This commit replaces the legacy global pm_power_off function pointer
assignment with the devm_register_sys_off_handler() helper.

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index 363ac80c0593b..0cecb53b62078 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
[ ... ]
> @@ -173,19 +174,18 @@ static const struct regmap_irq_chip max8907_rtc_irq=
_chip =3D {
>  	.num_irqs =3D ARRAY_SIZE(max8907_rtc_irqs),
>  };
> =20
> -static struct max8907 *max8907_pm_off;
> -static void max8907_power_off(void)
> +static int max8907_power_off(struct sys_off_data *data)
>  {
> -	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
> -			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
> +	struct max8907 *max8907 =3D data->cb_data;
> +
> +	return regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
> +				  MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
>  }

[Severity: Medium]
Does this inadvertently halt the sys-off notifier chain if the regmap opera=
tion
fails?

If regmap_update_bits() in max8907_power_off() encounters an error, such as=
 an
I2C transaction failure, it returns a negative error code like -EIO. Because
notifier chains evaluate return values using the NOTIFY_STOP_MASK (0x8000) =
bit,
a negative integer will have this bit set. This would immediately abort the
sys-off notifier call chain instead of propagating a proper NOTIFY_* consta=
nt.

When this fails, it might prevent lower-priority fallback power-off methods,
like ACPI, PSCI, or EFI shutdown, from being attempted, potentially hanging
the system instead of safely powering off.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927155745.1877=
58-1-clamor95@gmail.com?part=3D3
