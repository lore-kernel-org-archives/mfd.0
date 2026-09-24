Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782A47ECDF
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251923; cv=none; b=O7njnJ/MOockCseCGFbAZoWJtE9cxTSWg5yShucsNURc3FgG3EwRjJGaKdL2CzcyYN0GHOcSjH06Hx5D6bDz5P5qEBqygaAH1Gnii3jJu3XMftmErFg4rtjodhFX3otQ/rY3nxS87G2VrmLrgwwo1yB2gSFjiiGPBPweecaIHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251923; c=relaxed/simple;
	bh=6a2A7idEs/zAekKGaszSg+GZiSzskOB25QB6Ph6ptHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hHsf5IU/0aUsNMiqPXNOf/2PNK/ZptUXIbuZz9AruY5MADCsT8y1iJcVlvoDfADYVbZoqf1L7vNg5C58sSKeUq+UwR5tnNQScoBuROh3jmOd+J/iPvnfjjUv1JZpINFiNy7lhRkpVV3Jy9Hni2zxTj5jXJbk8Fuuyu2LfV4beYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcwbcsKg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcwbcsKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263C71F000FF;
	Thu, 24 Sep 2026 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251922;
	bh=6a2A7idEs/zAekKGaszSg+GZiSzskOB25QB6Ph6ptHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IcwbcsKgaENnRpqLXNFLP1flewXUZeM0ApqjtYzEa0EAc3VkCdFoYOMO+rd891SVf
	 I/eXmZCJxZP3dvgMJiFaSzcbeLAqZIB19bCrpt7BKDdNW7vhC4AH57oh4jj0NscJl4
	 SvBh+nG7fBe0FPM+KiacBFzDJUm2/N+B6R7GBUTTyzKuouojsoOfiEjPkEeibvT9uS
	 HxHSJJqfLS4SRo/Tlg5ZfooHHNVRf7fOW/rZyFK5xbAEWYWmmfZEJLO7PNQSw67Bwo
	 oQUDtzv5SnfGXgF8QgkK6WPCiQVd+V510bt+/fVDAYq5x7NMMgGIRH5nX+3F8EQ2cq
	 VFV1jjjO5n9rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260924120520.2511081-3-ckeepax@opensource.cirrus.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:12:01 +0000
Message-Id: <20260924121202.263C71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Now the core has a helper to signal a device will detach from
> the SoundWire bus, there is no need for the cs42l43 driver code
> to separately track that. Switch to using the new core helper.
>=20
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924120520.2511=
081-1-ckeepax@opensource.cirrus.com?part=3D2

