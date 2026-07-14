Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446504A33EE;
	Tue, 14 Jul 2026 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050102; cv=none; b=kghcBYSkv/RzKCuvYgkJn9PKuC8Sxvt7UfMyyx+pOGhb1hiLFaUH4xJwrnxCdt/RgQncZyDJMb4EFJ/yVx/8mFawudl4cEdtI46Sh+RWotu6SfN8QiCbL5Vb4X+mTTrFHwHqBJCPihZ+WfOKAdGdrCm8G5NuCZa9hEg7nM7QIJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050102; c=relaxed/simple;
	bh=Djhqcpt51okbCAPmxWZugZlGMkvSkyqWYAWnaFCl57Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dGQNsaXdvchWmmw9kbnx+D1ySPNz672KdxxHK++qTyOg0rmeuA+u/RLeJKkwdo5yuno3/0JAeYBfsyjh1acl3K7vH4l2d7K/lLYycAeYRMEnYv/pz4B1ICYqd4aatHQHfy6SCoceveiAjpzSXC3nW54l9q+MDRtt32cUy/stJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClBHOeHx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClBHOeHx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554201F00A3A;
	Tue, 14 Jul 2026 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050101;
	bh=eAfMx/0jkQYK4zlf+/Xx26QIug5isCfeOrDB3Tkz3Ws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ClBHOeHxJ11kaGcXJv7hlTys06lX78imKr9BP0hWiIysC5qEFDNJhOnl3SwCnqYZT
	 RIibv4GYy1YTVRdXcDE7bFsjPdq/OUWWzRpyuGfPy8zHEOibI9JGwT49IF3nz/qMfF
	 ifIifwRfdv6tic6/q+PtoC6gCrZhyBtoBfwVji08mJGa2LYHOAomSdrQg8XzzathlN
	 c2J2J/Kihq21TiHv6YECL3UxpjVwAdwnhSTJVZ+5R+Ev8Axfjt+yY5U6KbYNXpTERm
	 gRuofBaW+++ZVamo+seBjcwQFd4BbruGZ2UX0RGTDqT8VOND9BqvkhdsMZf+aYXz0T
	 byx1KRuEqUDGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 04/13] firmware: psci: Introduce command-based
 resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-4-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-4-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:28:19 +0000
Message-Id: <20260714172820.554201F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
> ARCH WARM reset. The reset patch is selected based on the Linux
> reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
> for vendor-specific resets but there's no mechanism to issue these
> through psci_sys_reset().
>=20
> Add a command-based reset mechanism that allows external drivers to set
> the PSCI reset command by passing a reset_type and a cookie.
>=20
> Add support for the following reset commands:
>   - SYSTEM_RESET2 vendor-specific resets.
>   - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type =3D 0 and
>     cookie maps to psci_standard_resets).
> Unsupported commands fall back to the regular PSCI reset path.
>=20
> Default to the existing reboot_mode-based reset flow unless a reset
> command is configured. If a kernel panic occurs after a reset command is
> set but before the final PSCI reset is issued, ignore the reset command
> and follow the normal reboot_mode-based reset path.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D4

