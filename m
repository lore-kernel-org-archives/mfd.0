Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414BE2EB859;
	Tue, 14 Jul 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050228; cv=none; b=KGpsP2P+ItGq/Y+DyJ4OKOgV7GxxwUVQVj8FQskfuMxHrjyiJWz5tHS5tioTwRxeUXn/VbLKkSERcigKDP/ChjhguMz8Xi6G0M/qCKJ1jOrn2kAQ7Gb0guLCXhI8744UUbX+KExNZek64qJH8RdV4YzJYhVGrWTtSNyw4wpszrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050228; c=relaxed/simple;
	bh=iVf7OXnwlwU1hsEPiRwu8LgZ3UrGFnD7WwmQZPMm3GI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=thzrnSpCenx0bjySoKC5pt1yDWaHhCjNjywRf+Gy+WENRItmJ8CMF5jHh1DoIxGjX/CDLRtWU03P32EY2iG47JBTsekSDkhYU0Ly3AlEIaoLxKrXgCnWMxjPqlTlu2xWdCmDD5PfRHhvDU2IQaiztYDK4PElqSqnGf5sE2XG1o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fy5tM4kZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fy5tM4kZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCB81F000E9;
	Tue, 14 Jul 2026 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050226;
	bh=iVf7OXnwlwU1hsEPiRwu8LgZ3UrGFnD7WwmQZPMm3GI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fy5tM4kZ2UltfEUUb0KISGhHZqkwESdDmnXtD3a4pPPP2jjNSU4HQYkfMczh23ylR
	 7aO+upI0QQ06bT/DlD73a3fMu2caxOMJ8BONB+YDCho5vbZEnH1vvk3nGQOUN0kQpr
	 k46HuvQTPtTcy35IKlrJ5bqaMNKRI7t8+YAOvAPmfDvIRTCtW4rbYqJ4zeoahxp+G/
	 OYvosWUFzJCV1WQJpqJOLP/lPrao+/9S2nYFoR+vNHPfuE473emRN/H0vJUytD2i20
	 7LqCkSqYxo6gZ1RyIGABVbF7vOU0ZlbgL08d7d65h/T68g6wYo7E2jSOr/mNNKjMdB
	 7r2/wTJg0ZhVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:30:25 +0000
Message-Id: <20260714173026.9CCB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
>=20
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D2

