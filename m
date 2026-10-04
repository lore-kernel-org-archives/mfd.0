Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE83BE175;
	Sun,  4 Oct 2026 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132684; cv=none; b=JM/PLn9oFcg3WTwTwOjOfzmkMhD3XbQvOf5SAlvtHO/zKspjvn3jky6jBjWB11W9HIFQF1ZNyYxPvvjdu2MYOdRsrg4JkskN7vMYrN4VTJpdW3CFdR2l6ley8brCPnAIDo+rlHEUPxyJ4KWNJ5kYTrj3hxo19YuQb5KXnSaGP9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132684; c=relaxed/simple;
	bh=dYxqay679/z8vW37gE5Bw7OHlwaLo+SjHIfQAgtZygk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o0uAkghHkXZCZvBLkk5xMYUJRfzKCShnZw0ivdO08A1sVKGSBBJRmIggSC66pd7pta3Ue1iN+v8y9q3RqgcOd2fKpK8htwyB94pPdOt8buAVsmT7/JA5mue/9VuPdKQ/tr1Waw5iIheXWzgqy9aztUBQh1VBF7gPylVOcqpet0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnLBf12u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnLBf12u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798461F000FF;
	Sun,  4 Oct 2026 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791132682;
	bh=dYxqay679/z8vW37gE5Bw7OHlwaLo+SjHIfQAgtZygk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XnLBf12uUP6jlScsWQF3rDA5Rl8HZaIjYifmkI8+Q9akOWKBjrtOwPeLdiSIiskRq
	 Tmi6Doxio/GpViON/lG6MUq2vtA1R1DvDq556BYm29LPU+aMZFUPgMiIcLX58fx6jm
	 /NeKUudaR30hFF/TMYMNoxb+qIoA4OuJw0QzTauTnqcYxFVDNwPzd1XWtxr6DyRWV5
	 4wMYxNvb7BiDqkKIWpGc3EynHDLhfwbvjssfklEofP0VNDcy7/45OvtSiE451Rn/TE
	 KoSeww8eEOvtD8USX9hmA7knLgkYEuETpx17sbWhPN+69MpHzEaelmLYA0xpZkKC8R
	 7q7uEBqa2pcXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mfd: max8907: Remove platform_data based probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261004164540.198446-3-clamor95@gmail.com>
References: <20261004164540.198446-1-clamor95@gmail.com>
 <20261004164540.198446-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 16:51:22 +0000
Message-Id: <20261004165122.798461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> There are no in-tree users of this driver, but it supports devicetree
> based probing, which means external dtb files may exist that work with
> this.
>=20
> Remove the unused legacy code and make this a DT-only driver.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004164540.1984=
46-1-clamor95@gmail.com?part=3D2

