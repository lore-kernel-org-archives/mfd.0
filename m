Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4933993;
	Sat, 26 Sep 2026 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426736; cv=none; b=Q2WyKynVhs8BCdIOCIsXdwRkNepnn5b9B/r/JDPfIK4WI7Ctcr2hNi0TTq9eeIzsBQDp4Rr6GvExeGb3G37F68JqRgMjVZ4RIPF4EPrI7JRahEHtoiiw46OBDM63VEL4SIaWFZfJ3f3oVVb30fpeOeDOaJDHQJcrWtnk7Alq9Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426736; c=relaxed/simple;
	bh=jxl4nBa/y1hzooNe/60T8lpRhy/BxIiB80cHgzjSrqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IEsKSvWlUfZqMxmp35RWLd79dZOc2eIglX2xpRdSyHUtOAQTs3MyOybagygJ1jhwiUk8p5kjGg7wWt0njpShT5eG4ib0sMjSHEYpV9uy7rrQwPdQhp34NACHMA4YVCp3jkxJHPN4HQddllnVZgcpECs9nFDtrmgX2qDEj5wDNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaX3yO0i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaX3yO0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC921F000FF;
	Sat, 26 Sep 2026 12:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426734;
	bh=jxl4nBa/y1hzooNe/60T8lpRhy/BxIiB80cHgzjSrqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iaX3yO0iK74k5ZLFBBaFdPnlGEFbHRCbUWOt2w+8XP5MZP061YR+BhCTngXgazjJq
	 QjfwjVrVVWOL/LRTinGG1Uc624gAabewgpyocX/4SpQhK6umHQ2zzSUM7WX22VWpte
	 kO5xOOxOO3PxORt4gBA2w5qSMpfg+jzXqlbCueH3uA1cFncruJUJkjTrr8rydxt8VJ
	 /0VJoaVXjJhQxJemGfjbY4oamJ0UA99LmVtkx8oDn3ejcqEOkozqu2z/WVvhVG3WGU
	 ziDmF3fZzMXssf+AdG+2gjUyMWwvXJ2JEVdcjP3GLJGqi3UALq5MN+c2JblEQpD24L
	 IGTn4tpwqhhHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 08/12] arm64: dts: qcom: pmi8998: Add USB Type-C
 port controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:45:34 +0000
Message-Id: <20260926124534.6FC921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> Add the pmi8998 Type-C port controller and PD PHY device node.
>=20
> The Type-C CC logic is at USBIN base 0x1300 and the PD PHY is at 0x1700.
> The node uses the 'type-c-change' interrupt from the USBIN peripheral
> for CC state notifications, plus the 8 PD PHY interrupts, including
> fr-swap.
>=20
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
>=20
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D8

