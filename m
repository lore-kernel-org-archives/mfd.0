Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98CF3C1D65;
	Tue, 29 Sep 2026 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691218; cv=none; b=Ia6Fowo/cwKDV25Le+Iqi1j5DhgYUbdJK+eSF+vSLzY7js3FR14ljGyT8dro2B2/gZ0t2DflZaEYmhdAX/3GCXQyK81bsVua37tDO2AE9ZCPU00e7/6pB7W/sI/bB6vJ1HlOdaKKUM1ax5+871TZkqZsue+t0n78BYThBljl58w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691218; c=relaxed/simple;
	bh=ZIj1FZKHAEarNaMZR4u6P7b6KEa5wksr0z+JIVZarnA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bl9mkRJKeznp7y3DHP8QfLDXAkweG4T1YByhzaHyOAhZFqYnrwHswN8hvow8NfUVKNRKJq129lf3jPIB8dTOSXVBKvjJJdxCzFpe84/2LvvP+i9LqJQILGpvLT4PWqNIAWT0lJyA/hUQnGIRgFI57dwpwHeb9GcX3znqALIHjkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9Bi1diM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9Bi1diM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0321F000FF;
	Tue, 29 Sep 2026 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691217;
	bh=vGF2tKinLVe5WlMT3+EZdMFwPcuI6xIIsrMD8CMAFjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9Bi1diMBPQPZbpF3Tiab4Z1R078Qzu2/xbkMYCX/Wew9DsffP18yQFxqQgd6b89R
	 okG1iDyh+FVnJ8NQJoS/6/2V07hIghgkaio2sVwM0FZ7GV10TTpaZYuzSLST6W/Yk3
	 iug5t6BODJs4pAjTmOOSU8tFF/SeT27V8qZ4hRlaftoeqzo9sa9BxDD5EyoWJd+Jgk
	 1+/NW7+vQnHiZGhx8TXBVhW4Ub0faAtUzSwEWyKUt8KYm6ciID8VwN480tzgLWeIrw
	 3B1P8qldlUUQKTBb+WLcrAluCbvbKeEvXO0q/1Dinoi9L3tqWo7wlzLWejzkX3988H
	 tCc3k5mWc6b7Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929140649.55-4-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
 <20260929140649.55-4-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 14:13:37 +0000
Message-Id: <20260929141337.6F0321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: rockchip: brittle power-off reliance on pwm-backlight shutdown
--

commit 33bb2c6f679e2298d49b0a4f468566e0d2a12e3c
Author: Yaozhong Li <yaozhonguwl@gmail.com>

arm64: dts: rockchip: fix power-off on Firefly-RK3399

This commit configures the power-hold-gpios for the RK808 PMIC on the
Firefly-RK3399 board to prevent it from rebooting instead of staying off.
It relies on the pwm-backlight driver to handle the release of GPIO1_B5.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa140b32..210e4cbb656ce 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -327,6 +327,8 @@ rk808: pmic@1b {
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&pmic_int_l>;
>  		system-power-controller;
> +		power-hold-gpios =3D <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;

[Severity: High]
Is it safe to omit the hardware-required GPIO1_B5 from the PMIC's power-off
logic?

The commit message notes that the board will come back up if GPIO1_B5 is st=
ill
high when the shutdown bit is written. By delegating this core power-off
requirement to the optional pwm-backlight driver, could the board reboot
instead of powering off if the backlight driver is inactive?

This might happen if CONFIG_BACKLIGHT_PWM is disabled, the driver fails to
probe, or an emergency panic skips device_shutdown().

> +		power-hold-delay-ms =3D <200>;
>  		wakeup-source;
> =20
>  		vcc1-supply =3D <&vcc_sys>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929140649.55-1=
-yaozhonguwl@gmail.com?part=3D3
