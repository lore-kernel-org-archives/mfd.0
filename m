Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B94C33C6
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576244; cv=none; b=if2GW7Oi4KOiVH85N8GCr5gg5kpiCd6U0NF0caZO+BRmn5YXfND7ki8xt1Ivzl1LiTJx3nrZuascsPyG4+7u2+rhnHe3sp19ZM2RwNzbb6NxCL1rsV1dTS3gAZ86t9SrZYWbk5ZzKFXijUaerNCaWtnxnb0Vg/+FrhOJHxekHmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576244; c=relaxed/simple;
	bh=LK+T6OBmPTksQ/GCjFUNIY3cMuUp6bd/6WBybqA+fh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dCOENVJkkF1JRx4cYGXxPAuudyQAqK2cd36CjRfhYYW34lEOfOmKPHULdt4Ir3OJhTtERNYyK9LAgtapwWEJlc1UM1mU/Apy8UFlYomFKfsePOUrgBBFH4mqr6bikf3eMP9L4tBZaL9aTf9XZBlffwvjWd3/S3fpJbhjUmJRpo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d52q/7m7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d52q/7m7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E8A1F000FF;
	Wed, 16 Sep 2026 16:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576242;
	bh=LK+T6OBmPTksQ/GCjFUNIY3cMuUp6bd/6WBybqA+fh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d52q/7m7TlUKa9DRavOhrma3onzyg5Q8G5A6B9Ujn4ZvU4G4oVrVkQF8sPfWcUq4s
	 WFQP5g/E5tX5eWFBtd3O6HzP/4kuehhP8g1ByhFwz5Qtwro9Pc8G0ydzHnSjYNS4vP
	 AMzNXB/JzqbCUSB8ybo+EagsOIKU1NvvFm7lDTzwmwsYKOnNxUIXzXmHYljDPfmSt5
	 /IyNURQnaFnPERVsdR5q7q+2vVq7fZwf7bQAfu2D9nuneVJ43jtEerNC29uPO8RBjq
	 7hd0KCvEjDU4lBTP3U8lwIwmzrJl61jPWtlVFtob5QAvBMSeypqx2u/aYjEZwYi8fl
	 WxjHQz5KGLsNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] mfd: intel-lpss: Switch to debugfs_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260916-intel-lpss-debugfs-v7-4-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
 <20260916-intel-lpss-debugfs-v7-4-eb51d41f55e0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 16:30:41 +0000
Message-Id: <20260916163041.B8E8A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> debugfs_remove_recursive() is deprecated and has become
> an alias to debugfs_remove(), replace it with the direct
> debugfs_remove() call instead.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v7-0-eb51d41f55e0@gmail.com?part=3D4

