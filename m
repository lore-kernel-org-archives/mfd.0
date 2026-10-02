Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A481472F8A
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939938; cv=none; b=tj7jtTs/dmo18t80oPJvrUoBLTlPSNVzL2I4OKM1Z3QCA9WighC+Svdm9FmBEJS4q/du63+vgeSe7mdH9zdSwyOlFC4gK4HD6ekyAoyxHs9eiG0Lfpx+s4zwEZpodSQzuw2amYzwCWmWZwx5gj8MWbyTWsDgHdXV5dcq6sMwjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939938; c=relaxed/simple;
	bh=zix/vfMrms+BrIV4F/GI/eG6VR9zV7mg2k1R3zmxeEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OmpskF0ymVOEUk3HojyxbBfm3vvBLT89QO4o6zTTUkGnRY9XkLRRe2TEHeePUO+68A75Sy7oC6mWIZMKbv6+aEZLJxglpr+ZVTcpfITu4IJZUA6pzeQ/WA9EDPxVRYYsTI0G+rU4dK4L54Li2a9uThvWJDAyeqblSuyxZd0+gg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/iLase+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/iLase+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6175D1F000FF;
	Fri,  2 Oct 2026 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939936;
	bh=zix/vfMrms+BrIV4F/GI/eG6VR9zV7mg2k1R3zmxeEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/iLase+jSeOj1kZTPF++GSpqnzKBT8pbGvGV/n7YwYP/Z0cVIUm7H5QMWiugAYi7
	 EQzMgGg9MjnOzy9iy3Gn9C3T0i+wEUdwHF/h/fN/ZpGXh5mGfqlCi4TncBNupiwzdN
	 AMhChOvnJGZYGKz6Lsc0T+3iZcRyarpD9fNBYNcIsLJAhgQjQ/7C4XNBWB2HowrmDP
	 iWPgUFn+zGCljFfIXokOLwG/QeOQadT/bm3htn/8bz/hftk2rB5Q1uQRm8dBRxYy2H
	 Rnj2n9rQkttXPrWM+0BVhdy5fAx808PuZ5Cn6NmVBJKj9aVLf6FtAuiiHXZ7NBr8WY
	 gQzrzrby0jLbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] i2c: cgbc: Register known I2C devices on the bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-9-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-9-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:18:55 +0000
Message-Id: <20261002111856.6175D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Register any I2C devices defined for the bus at probe time.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D9

