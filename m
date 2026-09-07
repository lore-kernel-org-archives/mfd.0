Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD982DC79F
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757038; cv=none; b=rGCHDhpLvgpHqog8dXNOhz09WRqAYbUJFG/gxdJH1Mg1r0fShK1ApvMkUjcxukf6VTClcNVYb1LPQUHD4zzJazGW/W/ePWHOQaSCA2ZbvObAY91SLHoclZQrh08PuzoAyGjrKnijV1hRF3fZtFHy05eD60AgT9HgB0PTopUFJoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757038; c=relaxed/simple;
	bh=IcmeMoIz0GQQegERig8DWugRzLCm7EldctLDuy9ufuk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rN58y12HaDaK97zByDJz2PKFKcZfmQW0FNSjvtunJ38YMPL8tWd24GusIq4hSO/U9nUaoJfhP7ddKN0l9MtYaE1zleXb7C1yFODq98/5W9fqQYJZ8dF+1WGJoq0KiPXD7JBQ+PeLrR0AlteV9Op7O7cljiflTcHH9Raz0Ekl8o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSYYur+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSYYur+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3481F00A3A;
	Mon,  7 Sep 2026 04:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788757037;
	bh=JUFR2SvAsZy/hXqVZXI/AWEfKvx5UC5u6mZk0tPoxgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SSYYur+6W7BJIHBekYIz3g9gUutJw8BduehnUy9dsapRZUMQ9PHxG8YP6NXxqR7Jb
	 XVCnPhtkdqiKYmRf8P1rklPZe2cE2enuwhDztzRzKAfVC0Z5vnlipah6s+H0CHuVWi
	 kf2PbjFNQ2ARm0BGjmKRRA3mia7z4B876q8ol501MzzalXwP2V6D1ZgXYwY6v6kjYK
	 /gZ84tV+WbFv4Lc19aKXiUnXtfUNQ3UfKRL0czLktLZBCRqwf8JRSeeKR3tD/+GjO1
	 vR2dFIbbRRyk3LB2In4Jy5JaZePZIKE4iLx0DSpVhtN4rRBFVy2fqHKxOrEDTzV2Ey
	 krbVxwT7wWyOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: ab8500: Fix typo "interupts" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260907045526.18873-1-hemanth.selam@gmail.com>
References: <20260907045526.18873-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:57:16 +0000
Message-Id: <20260907045716.CD3481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches a
> comment, no code changes.
>=20
> Since v1 the subject carries the driver name and a capitalised
> description, to match the MFD subsystem convention.
>=20
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907045526.1887=
3-1-hemanth.selam@gmail.com?part=3D1

