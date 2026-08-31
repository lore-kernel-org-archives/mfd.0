Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331603AC0D9;
	Mon, 31 Aug 2026 23:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220188; cv=none; b=SFkZ8amQWnG1ehGV0dDNVmh037GycRb6ijnrsxAGDhAktyfLbbHJICq8ApFd6pGYpM4u4x98SplCSmk9CkjvddNnS8ZKF8/364enL6wOttv3s8xA2ZkR8H4XIDLbSaY8L5hQsC9tmlK2uHe8nJX6OeAasIWr9ytO+o8E7knKHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220188; c=relaxed/simple;
	bh=B3zjU2jDYzjIK/sP2SFZrnlQtHZOY0wdyPHIVX1SrEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sq7FK9PqsLxn/F24p8EPdmYsE6Apf2TvJKUQQd0/gpsR+Fduijrm/0NzKuS3yz+OIBbEiwfoBmcTyv0x6TFM57PUQ3A9COCccPveulKZvfFaYQcc6mSMAb4fmONQICja0PG5pcU3xF7f+WWIUwmml1JtGPnZZWQRQ9DQdJVWp0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGKh18Zq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGKh18Zq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567781F000E9;
	Mon, 31 Aug 2026 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788220186;
	bh=B3zjU2jDYzjIK/sP2SFZrnlQtHZOY0wdyPHIVX1SrEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JGKh18Zqm4kP/0wBDRGaQyzhztzKMRANI7vOcFC3gD9niCpDYNTaBlXSDDGFpJk3/
	 ARsO73IA12fVHEUI4YdqyoFzmcW8S2yYQXkU563PnIGigIGt9rVIvn4NBhtwGM126A
	 bWanegpbW3jsn0jvXkaYCX1BomTacOPWy5joiOLGBRNX29in5t/Ve9efKh3973Ubbt
	 zyAgxXxfqj45hOdwSEYONsp6NdmDytqrGgsV9gul+YMQe6nu0pa3povGJq1WIay5uv
	 4OMyOx+mWLGL7iLyLwgr3T3AQf0KiZfEcWqh3gHsRwydzEfuxshyb/tpDjiYUCFPOX
	 rLezUqx2IWOjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] ARM: dts: ti: keystone: Align devctrl child node
 names with dtschema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-ti-keystone-devctrl-v4-1-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
 <20260901-ti-keystone-devctrl-v4-1-2922f2a44792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:49:45 +0000
Message-Id: <20260831234946.567781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Align TI Keystone device state control child node names with standard
> naming conventions.
> - Change keystone_irq to interrupt-controller
> - Change keystone_dsp_gpio to gpio
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ti-keyston=
e-devctrl-v4-0-2922f2a44792@gmail.com?part=3D1

