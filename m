Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1EC379EE7
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971719; cv=none; b=dvF/rKMS+B1zRmkW7ui3eksLR6CYQOoP16MnAoTgygmEWRKEweEhplgehdr2bkBP5cHo7RZrI8VPXVjXvOTzU6p8uO9KHMuPhXFTr2XN+lqxzdikSBhQKTeKevLhfzZwiQa0juYS83s1SIklxlo2US1/ZmuCeBoqxWBl8q1BW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971719; c=relaxed/simple;
	bh=KYZ0mP9OoHN7H3DiZlTvSrSw74xkPPKnrC0sioYraWU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uvOI0gUHAN03Dad6NdDYkQDQ97Ft+BZ8OdfTeW8WVCoPqiVpaj4e8elhvRuUs/mlWdBUfL3tFIXFDoaRvPHOXmTJoMUq6Xgc3nBov0bDd7HYVKmRRItLxErUqo8mozaysahOEgyzG32IumncW8AULoJ6uDG3Bxi+ddwPhsRwKDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNaT9uFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNaT9uFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9663D1F000FF;
	Wed, 14 Oct 2026 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971717;
	bh=KYZ0mP9OoHN7H3DiZlTvSrSw74xkPPKnrC0sioYraWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lNaT9uFSq4UeBfeSuPfpWKjCZIyynKrwLRzePeItvZSBJluL7IOq7SGpDVLa9KNf1
	 6OtsU2tQSsYnucTA9EuBo8urX0Iv/hAqka+ySj3o6PBJ0rbiaLS4umx56KsKCmM6vo
	 E3ykyRzVbuhADZYsXEvgpw+5yfkgRGVf7cYSERuQgTAFLNLX7DnQDjOG2uHkwKgD6v
	 eowe9C7NxwiU2HbiYuB1j82kx1mY5GHddBQpm6GZETWdb7VnT/AG8yGLj2cWtSsTdg
	 g5kT17ZKclEHrfnT+FgOR4Z8B8Di0pMpkI5JRINIOSyxUJUac6FwTL5oyWRunutZA2
	 Eq5gwV0EFvc9w==
Message-ID: <sashiko-outbox-171106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/5] dt-bindings: reset: Describe the BCMBCA PMB
 reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-3-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-3-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:55:17 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Describe a reset provider below the Processor Monitor Bus (PMB)
> controller, which owns the register bank and serializes accesses.
> Use one specifier cell for a SoC-specific logical reset group ID.
>=20
> Define BCM6846_RESET_XRDP for the coordinated reset of the XRDP packet
> engine and its three Runner cores. The vendor PMB device addresses
> identify individual blocks, not this group, so assign it reset ID 0.
>=20
> Define separate IDs for PCIe0 and PCIe1 soft resets and PVTMON analog
> acquisition. Describe the scope and prerequisites of each operation.
>=20
> Use only the SoC-specific compatible because the reset groups and PMB
> interfaces differ between BCMBCA SoCs. There is no common reset
> contract for a family-wide fallback compatible.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-xg6846b-bc=
mbca-xrdp-reset-v1-0-daf5d177e113@kernel.org?part=3D3

