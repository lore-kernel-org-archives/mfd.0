Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB054E7807;
	Mon, 28 Sep 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613146; cv=none; b=anfsAJEnCgqZvies5O6/c2FUCqESR7GAnnFS5ASQJrAKvoyVHh+vhYRXji495LX21foKxY/Ksp2I//vrakNovezOtoqthx3hS1UhNEGqqtDph65e8HV+CPWVGybauoCzOSN2tMtpTKZ8OTh9beGh03VFQxseypE8fmmezBj1d78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613146; c=relaxed/simple;
	bh=RrIxDIs1+YzFZ+NzUm+nNIHDS9XQzb8A/61hpLFltGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B4w6axMYbbMePynB5f8FpJ8UUQWmLefM8b+5t4pGT81zK4QBGsLpMndknwqesxICDeAr7eLBGxiKKDrr0W5fy8ZmK6Vnm2yz0gAfJuGXk/Br76sjbqd1dyagw1wC26zfmHo9oqYKVbnSJbbz617wkqwgVpFGreKrSiAc+RWF/y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2mGKXwc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2mGKXwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E2B1F000FF;
	Mon, 28 Sep 2026 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613145;
	bh=RrIxDIs1+YzFZ+NzUm+nNIHDS9XQzb8A/61hpLFltGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A2mGKXwcekLkMIZ8kUnSNJq8zOt754Z/3eE7n2eNz1g1kgN8nnItnUP99U8bv5D31
	 AVy+7PVP2ikTbL5ulEyw5bsNh9MkpK5LJK1PO4RlejHf0SStl8oTtMXYpRfX5H2Ee+
	 5Hi2QTDjNXq+cbAtCzMtnKFjHQm9So83Ve8fA/WxfWpVR2rfygLZk8RZcWkaqAxSd+
	 zVrWOkOg0TmgnbSiNaZqjXPMQF3q6luGY7x2heal67MPfPnmMBaPQllsNZO1bycrcb
	 pXU32ghfbZzu/w7U7iRZXRn9HjzP7hZlz+LRoXw5b5qMIuYX44BZbFNIWf4ePluLCd
	 skH/+iQDOuucg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 16:32:24 +0000
Message-Id: <20260928163224.F0E2B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-as3722-bin=
dings-v1-0-35f423a9f2b2@nvidia.com?part=3D2

