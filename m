Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1433450417
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 17:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199007; cv=none; b=HgHRQWm4v5qUsR++04czrEpxNGjkPDid8VkQzTR4cMEreHvrm9MAMfDBZVtPqwQaQZ2t3wnWjbQtOjIE84g0B78xhivkaifwpV4GkeDQvq2FFe5opXpMDmsCfv+Vpm4J/lFmnhQL2IbQYh0/x9gUhFxV7CcRLoWc7zU410QNgmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199007; c=relaxed/simple;
	bh=S+KV2AhwX/+j7taaOkj+b7VsiTE205miYjoioL4SzBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=smT/OwmiV8AAWuvVg8JFpcDh3bzsJxXOYa8zKKmrbfrq4CsajWBvL4dPgWrHrdgvc4PiQ25F0Al887CRCdUKsWXWCHILkTzdP3WMnqZWMALEyAeKh9imJe9oYYHPVbsRmWJ//bhnp8WtZs5BEBFRhtLNq7m+cY3R3ahYhG/U2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNX0zHO4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNX0zHO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D27E1F000E9;
	Mon, 31 Aug 2026 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788199005;
	bh=S+KV2AhwX/+j7taaOkj+b7VsiTE205miYjoioL4SzBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KNX0zHO4mN0xu5sPkrMaQbIFFUzmXMXKAa7sucLClI04bBeu/qCh87d01rk2R/iVX
	 i03g4eH2dGUTdHe7DKn/k2ld3MxFxS68Ct1vEDla1SY/FymYl5/1S7wKwlT8OkD3cY
	 k5Y7x07aDoSDzO16N8ZO8lQcacdeOsvvPdPCr+XYzaQLCQZm6P/OVunRSIwGpfuHa3
	 98ZxfGJUSd4ZXBDEcNVIdI9X2egKAKM9+qQHSK7FTaKyvaxyDAKtCSKep1jUgfXV78
	 FMeXkWwZHcFtyoWKJZ95VpMdYRaC+uz/Xr3dbh/17wsnVf9Lpl9VCSZc1IBI0yku5+
	 Jv0dra1crmRqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mfd: cs42l43: Move to core detach helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831140157.1736905-3-ckeepax@opensource.cirrus.com>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
 <20260831140157.1736905-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:56:44 +0000
Message-Id: <20260831175645.4D27E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Now the core has a helper to signal a device will detach from
> the SoundWire bus, there is no need for the cs42l43 driver code
> to separately track that. Switch to using the new core helper.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831140157.1736=
905-1-ckeepax@opensource.cirrus.com?part=3D2

