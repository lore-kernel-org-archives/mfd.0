Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D75F320A14;
	Wed,  9 Sep 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946544; cv=none; b=MIj+MaVq+h0mJGzBXi98bYDXyS39QVutNcW5ZRqB3Ai4EjXmJ3MQhAHuf+bw7gBI7YJxMIgUOUYoOPNrHubzPEcbQ8T4dYhugk5UiaGUoeU3IWtk4TkV12i6lTtJ8cNK+YeIHV5nzuIEE9E06aoIG0Pkk3WFVJ+Ri7yr3ylmVr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946544; c=relaxed/simple;
	bh=oPOh4Ng0FG4zsr2l4rZQ6yQq73xw9bX4k+77S6IfVp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mfthM86lFKVPj9FWinZ3XaZEcnudXcgqV96PIMP37JTsjAvvLCMro3x5OVQKmc6FAh8QFzl3Uyvf544StI3p6hY1rNWS9TZuna46W7+nY0mIwrAyUtaCr8psFZXbKsVhbKApwABuE4k7syR/PYgicYC+H5RexXsHbUDo9Ycy0LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5AsgwiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5AsgwiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC381F00A3A;
	Wed,  9 Sep 2026 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946536;
	bh=oPOh4Ng0FG4zsr2l4rZQ6yQq73xw9bX4k+77S6IfVp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J5AsgwiBq8z2lPwWzXbLNcOWROdxbgJhJffnluIpi5vksDXNPuypXevupwpKWyILL
	 AuE7m8b6fPUi0uWvs+NwlBaj+0FKEMl1CpNZIlAVPxTuA0KjNlGPY8IEeh/nnilBBZ
	 jGZq96c4uNrnyKHk+NV4lA6nfJfph9c9AuotsQs4+Z287QaKVKasvyWBmSOF2c4qTS
	 FTm+TNsCFZc+tfPqW9HKTaUwQoh3Ql1XVVHPMMJbGGat2iZ2kpSfJsMltk9yd38hxx
	 nfAlmvOSaThmZ8+QUfe36So1Gex82JRXntLxex4t5yUZl7+NtMpd0X9SkSwPEaW+II
	 eC1SygziXN1Jg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] arm64: dts: rockchip: fix power-off on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260909092728.1859-4-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260909092728.1859-4-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:35:36 +0000
Message-Id: <20260909093536.7CC381F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> poweroff on this board drops the rails and immediately brings them back
> up, so it reboots instead of staying off and U-Boot reports a power-on
> reset.
>=20
> Firefly's BSP drives GPIO1_D0 and GPIO1_B5 low during shutdown, before
> writing the RK808's shutdown bit. Mainline does not describe GPIO1_D0 at
> all, and describes GPIO1_B5 as the backlight enable GPIO - the vendor's
> own backlight node has no enable GPIO. Nothing therefore releases either
> line at power-off, and while the backlight owns GPIO1_B5 it can hold it
> asserted, which is enough to make the board come back up on its own.
>=20
> Describe both lines in the PMIC node and drop the backlight enable-gpios,
> with the settle time the vendor uses.
>=20
> Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk339=
9 board")
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909092728.1859=
-1-yaozhonguwl@gmail.com?part=3D3

