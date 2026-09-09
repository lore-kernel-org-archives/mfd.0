Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC33E44E4;
	Wed,  9 Sep 2026 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946382; cv=none; b=WMOb/6tnH3Y/dJx0IsbyLMjoFnpPBmj/qQGCojaGr/pGEDVIwFHpLqyH9G1LOwLVpeHeZTqleTI0tYIWAfXrbKo7BbsQWxXPc3yWY642VTuEZt6sOQYsJu2ymz3d0aljuRBcoEwjEtoApwKWQlN8YwlXb8H3Lh3evL56wxAkuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946382; c=relaxed/simple;
	bh=9p/+4MeWuO9yGb4LbB4hCnRnPtmc+SGf19sh7h1At/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NOdgM/kDeJ2onAWmXArezynVfY4CnXt0ZGt4G952Y9vJ1lusYH754ODWiIG/pJGX9oreQbwngCIvMulFeuUEc9ceeQZFUcouyrnIQzGYTgmzzZrT5dG0J5Xdf6U2YfmH+PXtUzqL0o0SKjHw5HMzx8fBXD/GPw56r5ij6mE3UDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heiR+Rjd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heiR+Rjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F5E1F00A3A;
	Wed,  9 Sep 2026 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946364;
	bh=9p/+4MeWuO9yGb4LbB4hCnRnPtmc+SGf19sh7h1At/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=heiR+RjdB46w7hlYnbjGuPmK+dJgrrJqMiaBDe5mbiBYORVN6CSyeudWTLnNPUdu8
	 QjMhi360SfhUMPXIb0CPxf5BTm7cYEWMHjmEVALKLHhMl1c4GV8Rq9+c2kHPhbJSUw
	 /XN6Xpnymql0OGM9/A0zfMCsVGQOy0jnDVz+dVpc8EixKSK1M2feFIfu4gjcBY5b6a
	 T/q/1UZfBk0pz5QuZ79F3eWcG9Q8t6dGRJP6pxT6a96Cuv1ADMxHI4bIDrK9LXQli5
	 GGl1G8EKopqfUhVAWYUpSiYYeiof7aXtdhXwe+yj8F8NLDZ7r8dEhrWbLUul5LkSBe
	 xT5EZ30kaiGOQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: mfd: rk808: add board level power
 hold GPIOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260909092728.1859-2-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260909092728.1859-2-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:32:43 +0000
Message-Id: <20260909093244.27F5E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Some boards route "power hold" lines from the SoC into the board's power
> circuitry. Those lines have to be held asserted while the system is
> running and released before the PMIC shutdown request is written; with any
> of them left asserted the rails drop and then come back up.
>=20
> Add power-hold-gpios to describe those lines and power-hold-delay-ms for
> the settle time.
>=20
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909092728.1859=
-1-yaozhonguwl@gmail.com?part=3D1

