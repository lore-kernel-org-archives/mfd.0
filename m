Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04F04FECE8
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569795; cv=none; b=bI763gPzYQnGWApNFIoEL7GqggXmOVW0UvK0r1qqg2n0l/Ldv2EhIkRMcBW3pfxeZ76Mvr1A38wWotUqCvCVh4lVMnMzTo3IShAfoZwQzJ22dUnvI6+mgAW0FCm+4X8s/s2MI2BMNRoXiUgCI8ZaOG1Amz2M4zbHeFy5Ftc8hcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569795; c=relaxed/simple;
	bh=QuxnB5JDBl7CMCpRIgTRU23RlSQhmbmynMzuSaAnvvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I/hnAk4xQ54haXfjUDmzCrEjIryiyvmMhw3Lq7uG0R/3do+wYXPxy5yVYLtVHBrVom3e5BWDcQQsY4+IMHnfHAly76Q+z+1mreSXDf+ZJ3DUi2IfllVn3CCXBEq+GeFpDOs4/+Ipb+6Og4QBskNAs3zSHnsrjLGXWjpKiNL49zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wno8RmNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wno8RmNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5FE1F000FF;
	Wed, 16 Sep 2026 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569793;
	bh=QuxnB5JDBl7CMCpRIgTRU23RlSQhmbmynMzuSaAnvvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wno8RmNG43MfVecikMeQuR97lK2GK0z6+ZgcpTCAWV7CbaSuFn8Z8QV+uvcCws5Dx
	 +9ej+7HC6ST/bgr0hwYdHo9AEyRWDvbXUa2/Oe/INK9TbKX15YzfAX/gSoa+NrKNhK
	 aHqXPbcUC2rMrXJlBN3xm1o38euG1Z/71QhP78ATof+i8qD6mEtXCy0jvbW9qzi68w
	 is0nTlvNg3YkqkCEQgFaBzhXQXyW91kShduVyp1v2FiDcn4cjjB1YqwoSlUX5mqOLi
	 AJ4fsKATMBSJ6MXSxySGPy/h+Dv6WWGEi6PKxJ3ywe46RmXTpwy4mPgTRz1xL2poEB
	 OezPuumzP0VXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] mfd: intel-lpss: Switch to debugfs_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260916-intel-lpss-debugfs-v6-4-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-4-5c118ac430ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:43:12 +0000
Message-Id: <20260916144313.5C5FE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> debugfs_remove_recursive() is deprecated and has become
> a macro for debugfs_remove(), replace it with the direct
> debugfs_remove() call instead.
>=20
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v6-0-5c118ac430ed@gmail.com?part=3D4

