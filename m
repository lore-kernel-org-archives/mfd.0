Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454344A3E0
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114818; cv=none; b=E/AH47BqR0TG6YNx4RgGOYPHrOG2X5sAZhQHo0Jw28N2F5GnA3kujYOZBwkgfajwyTcqyhfC3akU2dJtuO7Pe4WV6GPZMaJiivhe8Jc0179fB3khpXbugO8Ico7Pf60TDCEH8ueotH+MdNSnHD0mpKGhMSHfX4RoRbV0p3Gjlo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114818; c=relaxed/simple;
	bh=iA3eojCQzhcLhvq4j8ecRT0h1Gcj0SmFFeP0V8TyHYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RqlkKf/g+efNfJCZoSeOh8/Ufhrm9oMp6b0KJy5uQjvm8z3cwu/bUQwXKakKYZDwDBw+V0fknFbJ2o2J2dHuHpmgMKsP1om39tZZb7DaAvS8Z6Kbz8/VLHGhRX5Clqlt3HsVOmwjh46J/h4V/tFSIQx066b9iClhaNxW/NBIV40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+w6LjmS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+w6LjmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F5A1F00893;
	Fri, 11 Sep 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789114816;
	bh=rsFKbTJ8zL0tz4CSgUoDjCG3EEhUtklVM1zVkYkWNjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V+w6LjmSGic/IGqO4WiX3uyUYhy7ccIKIP7EhCDbrD7v7GK8PuOXReBgRyIEQ9SUc
	 mhr2NsKkHoVAgT53Pdhw2SVGknMLH0FCyOZTyUJ2ueMPPgGCIguFJ07NAf+tHZjENb
	 tOyhvLTQKX97r3/rjGG3/hsXeAoyNPiJfRT/gHd5ANMBV6R8m607kJuI3WTIIKKgDa
	 eSIodAtbFPmlKo0xln9XeAcuVWl8Q5ChhiTzYH6S4qdtdd0F+SAnChdHMnnqEPymrE
	 sKpJEIon2rpg7UfSAcQQN6xB4vnLUhVB9ATJsiGeRXLlnZ/IEneFAXSksyDzt1SUaP
	 pt7S7NUL+Qn1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND] mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911081022.3475479-1-triet.hoang.dev@gmail.com>
References: <20260911081022.3475479-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:20:11 +0000
Message-Id: <20260911082016.06F5A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] rn5t618 PMIC probe leaves restart handler and power-off callback r=
egistered on failure.
--

commit 29ccad5e24cd4a702e3d9e1445050ff871b456b5
Author: Triet Hoang <triet.hoang.dev@gmail.com>

mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

This commit converts the deprecated SIMPLE_DEV_PM_OPS() to=20
DEFINE_SIMPLE_DEV_PM_OPS() and uses pm_sleep_ptr() across several MFD
drivers. It also cleans up the __maybe_unused annotations from PM callbacks=
=20
since they are no longer necessary.

Link: https://lore.kernel.org/all/20260821092508.324787-1-triet.hoang.dev@g=
mail.com/
Link: https://lore.kernel.org/all/20260829050228.42638-1-triet.hoang.dev@gm=
ail.com/

[ ... ]

> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index 23ca00d2c624d..8c68dd16bb9e3 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c

[Severity: High]
This is a pre-existing issue, but while reviewing this file I noticed that
although rn5t618_i2c_remove() cleans up global callbacks, rn5t618_i2c_probe=
()
can return an error without doing the same.

In rn5t618_i2c_probe(), the driver registers a global power-off callback
(pm_power_off) and a restart handler via register_restart_handler().
Immediately after, it initializes IRQs:

    return rn5t618_irq_init(priv);

If rn5t618_irq_init() fails (for example, returning -ENOENT for unsupported
variants, or if IRQ chip registration fails), the probe function returns
the error directly. It does not unregister the restart handler or clear
pm_power_off.

Could this lead to a kernel crash? If the probe fails, the driver is not
bound and the module can be unloaded, leaving dangling function pointers
in the global system state. A subsequent system reboot or power-off would
then execute these invalid pointers.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911081022.3475=
479-1-triet.hoang.dev@gmail.com?part=3D1
