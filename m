Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE4952B1F9
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419684; cv=none; b=JcH+AgfO2X3DtgnixVY4TmTMY32IYXc7u6XkS84To5siXlugWXmaDSXfGWs1D6FWmalVY4ZIApt9wxeBr0JcBuWG7V59XbYLDBbrTU05Qg4ToNHDxeoQrFMww82eXCKJ/ccuiaTbUiJtGqTSpE318+7ZaodjKv8Db+SNz8X7nkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419684; c=relaxed/simple;
	bh=0vujs6l2R9Kxn4dWf8QzIyV3DJHdduyvhWt0gdpdpAo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=I3rYyiuub6A7b8E2wxO7gGWMUZQn6YnFBiKAPlxthYWE/Ictpi6iBeHlOakMf80v73TO7Y9nPGCdkrauj3438us9HUfSi/3L4a3vWv/MBCkZ8FIgQq5TX6JFP1acDckakx+7BuQkYw/5rfTRvq/pEb2jd3c+7d9fsOmn6YgI2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRvSf5uJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRvSf5uJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018221F000C4;
	Mon, 19 Oct 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419683;
	bh=0vujs6l2R9Kxn4dWf8QzIyV3DJHdduyvhWt0gdpdpAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRvSf5uJX6yoW3erMF0E5qmoo7IluroqqKAPk1q8TYN6Xx8uSHmNx4SLmj0t6AOXh
	 s3SzqgOv0VjbMniwab3X8aKzIkut7kbqQZKnwXJrWg3iP/s+8rNIl34d50kf1GigeM
	 J6jVXpZ8oCLCvkexYCwWdyRtVX/W9STY70yKA7kPFFxPKTnM4QQuAYi8VDZsyZmXRy
	 +jVxdWprVl5jVxzAvedsBv7ZKZdEcyEYJI6Z5OnQHg93MGrY9nVGYEaeTkOLVZtEEp
	 +kpXU9xVv0eIoMTj3Cv5JCRbMfB3tNlsV+dywBmcPY1mRdN182551bWN0n5mlOQ8uj
	 yn+8Err4A6KVg==
Message-ID: <sashiko-outbox-177356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] mfd: ipaq-micro: Fix out-of-bounds
 stack read in ipaq_micro_str
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019135441.1420968-117-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-117-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:21:22 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> [ Upstream commit da3a98c941753255418616d249e5b40db0927c26 ]
>=20
> ipaq_micro_str() decodes a UTF-16LE string into an ASCII string.
> It copies characters to a stack buffer retstr, but fails to
> null-terminate it. When kstrdup() is called on retstr, it can read past
> the buffer into uninitialized stack memory, potentially leaking stack
> contents.
>=20
> Fix this by initializing retstr to zero.
>=20
> Reported-by: sashiko-bot@kernel.org
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Link: https://patch.msgid.link/aintJF4X5tWDW-Ej@google.com
> Signed-off-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-117-sashal@kernel.org?part=3D1

