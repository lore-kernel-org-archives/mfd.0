Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944F370AD5;
	Sat, 10 Oct 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648698; cv=none; b=eNzLbwgxY/xPg9q4CaWuQGWHGYRAHkhm0oLCP6U1cOIcndahbuOt+wvnb8GKZrWMfuxj2oWpCEu+uy7uFf/QjPxmjuR+vIzrMqnAZzE5bh0f0WIIw1xME6HJCaHuRXeXjH4htn+GrODvr5ckbEKJ0fwJRLalaVVlsy58qQi5dt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648698; c=relaxed/simple;
	bh=TYgH+qZn3LRlT0AeC5XB5axIbXUTcYbWGSXO5rD9Xy0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PDwA+lY5YLxly5FNEgV5FTiqk131/p0wxYlx4b1O3k1xcpm4Q9w9+7LhBirUSL/4/0rFhm0I956KTS+AW4+5d+EZ8w0n6FxXPXaeuzaimQWsNN82AIcRNI1+WgYTnvw6LicCgS7nOIfUMcAjge4o6C9DFIVvp7JLvfW2AMZIfO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWh4OUVk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWh4OUVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3067A1F000FF;
	Sat, 10 Oct 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648696;
	bh=TYgH+qZn3LRlT0AeC5XB5axIbXUTcYbWGSXO5rD9Xy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YWh4OUVkVD2nIS+Yfz7fh8pNOUrG4i+SiM8o4CEILSFBqGQSRcjyYgNFzPZbMwwdI
	 yu2Qr7z2CEWzVRMBh0q7amGaVhOXHXzww3yEidYrd48MkitoUkzuDSQ5lxO4ZaKl1m
	 Xm/m/zfAj2O8SFtAXF+9LuPPY/NsAo4WoGtmlXZJE205U30hRp3VBVnhptQchLqdBC
	 bG/6RNxDGxIhkc9REQ3Ac+ljVSzn9PNIUcJy9GXi6kDARxQn6B5HBM9qnuFWVfsl6/
	 rfQyhpaXfQYE2sG6LT7NEl088RJ2fR9lLHJ5tW895Ya08Z1N7773EpeH2hpCMDgpxa
	 jNwEI6sEOgRSg==
Message-ID: <sashiko-outbox-166716@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 03/10] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009161102.38961-4-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:35 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
>=20
> It does also support i2c and timers but those are not currently
> supported/used.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D3

