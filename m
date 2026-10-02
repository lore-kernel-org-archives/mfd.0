Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ABC4534BB
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940191; cv=none; b=MqePt58lMn++yZYi17lAPomFs0eGqs2Ecq5UFFQTkYFw6kVYAAwEg4cBgg2wzotJz3x6TZtOvh2SPyuBSfwGXu6z083b1oVdV8I/3B/Osz99tjITsMGCAu21NJQN3kdaxc9aMw/uo3jc51qCk8ytBD2zhc3RUyiqxEMq/Q2Y3sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940191; c=relaxed/simple;
	bh=XIvol0vdz468uFSQxg87S4FdzyJeDvRHMU3AZmzr5Cs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J2wDRbu4hDMljPL/tKu+Q7U96CpX9PdOAVeAQi+7zXW5y0veamV/H3y6eNs+Rgzw9qt9+uo+lX5EpPjYZ+WxF20mxkap4f5xQERleJtAbu1CZ/11fPEf2bSjTobZR8U3HwtY8qi+PGL2KwWjuFMbrPW5pXVJp31RYMc4nKkHjH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOzVmjSn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOzVmjSn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5801F000FF;
	Fri,  2 Oct 2026 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940189;
	bh=XIvol0vdz468uFSQxg87S4FdzyJeDvRHMU3AZmzr5Cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GOzVmjSnwonFNMZY7o3KRMJ5YGlvuESShtrNq5YvMSgtXtQ/waxXvce+O2W45BXIp
	 p/Bz4uAmAmltuiN6V8IyK3EVdQ9AyUeE2Wj3bn7SadPgjrKzssGDEMuOxXUQCrh6JO
	 g8FDoPrrJcAZKG9cJViGxOoRstLgdKFotMM5oGNn4HMe5K1z6nWcn2tlhfpoOFTJe4
	 VUg5nulfu52+bnat5yseyPvQFSQgZ0N8lutWPLdRiHlMwKk3cMBmuQGfFXPlcTMT3l
	 IUe5PLELNYKYfiSuno6lIx5ltsjygFKSGBHCIhczROR52u1AXz448Sz+cWSBl+pQhR
	 Gy0ms6fqWqShg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/9] i2c: cgbc: Use plateform data to get bus ID and
 adapter name
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-3-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-3-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:23:09 +0000
Message-Id: <20261002112309.AE5801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Obtain the bus ID (from the BC point of view) and adapter name from
> platform data. This allows the specific definitions to be removed, leaving
> only a generic adapter definition.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D3

