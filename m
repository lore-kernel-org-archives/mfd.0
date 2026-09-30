Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74C9502762;
	Wed, 30 Sep 2026 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777868; cv=none; b=n3SZ2hhjpUT3Yml2pfLQ/logK3t75IuLQWNFyeT6+8MWlO1Dq3FpraWPs54EOb4I2SaTo9+2Ev//dgOkmhVaMB1MhsTk+LnDX/UUb5czfkvQuXWV1JSS/J0kf0wQEK060YhG8JdP7m7p98xtoWfQCLRZzghVCRnJyFgumam1wmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777868; c=relaxed/simple;
	bh=Fl3wZd+Kx6Db8Lp9IduNBST/8Lugbi0Rfh07Q0mu2gs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gWfZLYpNf8p5cBdW/Y8NPQTdbcLZic68Y/QIWoOK770xDrQN15+9S0TFYIu8VhD652OiWZr7UjSOaFEe0NUwHo0evZmc9Y1NhAh1VcNDTkiGQMOq/Ttst3I7JR5XeMCbNwSTLon+BU8qwakkNhSPme6sLWmKeYD+c+wYF4AALBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtfwSvMc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtfwSvMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1FB1F00893;
	Wed, 30 Sep 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790777857;
	bh=Fl3wZd+Kx6Db8Lp9IduNBST/8Lugbi0Rfh07Q0mu2gs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtfwSvMcwmQ/X1TMHFWYlmmEUnsLPOnfqxc94KY3yd9/g7ePCRmz/mo1Mnv2KKJrJ
	 h/9X6RSnOTiX1ERLaCUpvvVNHFphcO14N87Fj4fNVh18QAqKbuZR4Ry6CUQibxAUR+
	 hVCA9uIWuXaHMoIO98cVaDKxtzTzI0Mvosw9cXgOm1X4q32CM9Tg8LrurlOF1b9X2W
	 loYZMlv83OL9m7NfxXMpr11VNgJ5JS04WU3PL3dychi+KC0DVkMNGHI+O0RfrTZ0Kk
	 2XEFpWuOUdVX2mHxyQv6Q1zPBPWL533ScDfBYglNNeKTzjN0qK1jP/IaulSXylvHGq
	 NXH6zILdsvuYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: tegra: Add Tegra132 specific compatible
 for AHUB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-as3722-bindings-v2-3-a3bba649ebf9@nvidia.com>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
 <20260930-as3722-bindings-v2-3-a3bba649ebf9@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:17:36 +0000
Message-Id: <20260930141737.6E1FB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Thierry Reding <treding@nvidia.com>
>=20
> The AHUB on Tegra132 is backwards-compatible with the one found on
> Tegra124, but it needs a specific compatible string anyway, so add
> one.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-as3722-bin=
dings-v2-0-a3bba649ebf9@nvidia.com?part=3D3

