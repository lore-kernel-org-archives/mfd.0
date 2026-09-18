Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3C3DD521;
	Fri, 18 Sep 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765554; cv=none; b=edFRul98q67/OOnr0FpPBXRYk095HyOYULx2qcAuMJIqsDTcQvadx69CkGXb7KqBp1XoaaacFJP5QvmASo5F8d5JwykIBpTEzHjAEeyDXdO3gx6QbRoMnif3z7hs732VkGbxIyoEfyYIcM16Y9V+y7wVA+coVbUF5Ol1kbdyEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765554; c=relaxed/simple;
	bh=ZNAMduItIjHSFpMBPNS83GSePyemJpIr6HL1PT7mPgI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u4CGd0Te9tXFNhp23u3meei4N9v4BzUFTVS6vv0MVeaUqLLi/d/rsBJLmUfcEKrLE39vvYwyLO3UlPOTVEuzgXeZRGjCnuQg24A2RK+A0nhMzfrxjZAyVzGtMWpcrjqr62SqS8Xcr9DoDQEtvq8CyeGSC8vmFcLDZUx9pZYIDcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhTb+gzO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhTb+gzO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A82A1F000FF;
	Fri, 18 Sep 2026 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765552;
	bh=ZNAMduItIjHSFpMBPNS83GSePyemJpIr6HL1PT7mPgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NhTb+gzOC4ZjDBC4qgaFY62ioL9NXwsn6FjuUs/Uv9l9HHN092ZImZn+UMaFWG28v
	 RVvCNOuxfhG71NyYJeWjioOSKiGMnEyrC7fJ/xK9XBw07aN1kvHGCu0BFAOnb/I5ul
	 zgp4NsQVMkA2wFDoWMkQf52lBqAj9lIHZ1//VZYT7ppJyl7nsaTUTn5RZv5n+bQjBp
	 4dl1QczbptS78nbV4ysYYzf7ztZERhvYJtI6BgFhN9/FFegY+x3YHEHJ+VJzklxGnv
	 zuJQTIPrqt5bpMGcFYxCK26LdOmDK7cYsT8meVO0HBKe9FmrwMNwaLdfcpxqMmEiNR
	 vTOvibRy2Xssg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260919-ti-tps6586x-v3-1-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
 <20260919-ti-tps6586x-v3-1-63dd240f4684@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 21:05:51 +0000
Message-Id: <20260918210552.5A82A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Device tree validation throws warnings for the TPS65911 PMIC on Tegra
> boards because wakeup-source and GPIO hog nodes are not documented in
> the schema, even though the hardware supports them.
>=20
> Add wakeup-source property and allow child nodes that match the "-hog"
> pattern.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-ti-tps6586=
x-v3-0-63dd240f4684@gmail.com?part=3D1

