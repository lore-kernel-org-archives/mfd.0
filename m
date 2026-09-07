Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA73C2D
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 05:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757304; cv=none; b=oapYWInOghviOW/vb25r8iC66XAGDl62opVuBUCa/rJxb4+TEjlGeqxPnMTo8Lzxq1Q37ib+e6nHoQ0GbgUM7OzGaFh0EWclF29wsbyaGEicIJaljNPx17twgkWAjRncaAlklKewcGGXAaGjzpFEW+fwHCsoFt26vWKEj37rw0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757304; c=relaxed/simple;
	bh=SWwOyKiihAqvtBxpe3GwsEaxp7d21x1lCvuz7jLJf08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SR/4ZCZZUC9bGlKdA90nmFDM54+9lGqCGxvFNpnWjgOEVogHKlOdtSSIkRDCkobdEoF+wLKxnByb47bHlv9uAIG0P1KdC6177OCnE7ZDwdyQEVBhjVp2jWGEbA+8WyPVnICn3kiz5BxcONpFryrrSPckAX9FiqR9mjsX7+M3bvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEWPWzK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEWPWzK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49701F00A3A;
	Mon,  7 Sep 2026 05:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788757302;
	bh=SWwOyKiihAqvtBxpe3GwsEaxp7d21x1lCvuz7jLJf08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZEWPWzK4+Z6UoXlsKv2zAvM6w4v/V+GvWKgyFigJCG4oLkv+zRIOIUoDZkIP6yK5O
	 Dft+nkk2jnY5WPlonxgjZ9EAGBjl5wNQ/ePV9Qv+swNSHNrCmUydsLq9NF5jcAf7Xf
	 6erSyjcJBwLXZEI13KDhNzv2+5hPGvXxsYoH+YDRi9l4qNDUd8f2v8UtGuBvqzsslx
	 qm3IallHkvKVuWw53/J6MgCzaQi6nogWJwuAR1WDMeETiE/jWqIchtm/np16Vk+IAd
	 EWjXu4AcFh1tB97VkxU98a5FaZWJzdpxhtkX1FSNNNvvmiNoU82UkceJl3YNhb1FWu
	 AYbxSmBjSuZYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: Fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260907045951.23562-1-hemanth.selam@gmail.com>
References: <20260907045951.23562-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:01:42 +0000
Message-Id: <20260907050142.A49701F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
>=20
> Since v1 this also corrects "wainting" and "comapletion" in
> include/linux/mfd/si476x-core.h, which checkpatch did not flag; Matti
> Vaittinen asked for "wainting" and "comapletion" is on the same line.
> The subject is also capitalised to match the MFD convention.
>=20
> v3 only picks up the two Acked-by tags that v2 dropped; the diff is
> unchanged from v2.
>=20
> Only touches comments, no code changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Botsz HUANG <huang.botsz@gmail.com>
> Acked-by: Nick Huang <sef1548@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907045951.2356=
2-1-hemanth.selam@gmail.com?part=3D1

