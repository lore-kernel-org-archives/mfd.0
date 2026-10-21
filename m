Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585228;
	b=MGkzjjrHw8eM+3CgyAKZ+tiKiQf0AFZoidpEQ24rrzJmM22wkakR55o43sVkpFJe5dKE
	 urw/7pzqp4C2fKFfXkcU2IKLDoFAUwVM63yJDOkLPxoVMSLbHcgCoSu1qEkiaJz9aGEgr
	 Y7mdG2s1PQSHQh6GiUIRs8BxY1pR+CqI/AqWxO86bESrVZCUALwLx3OimRCoi9ut+0jur
	 /BVQvKsMugNbHy+CS1bVV9hLfmW4s535XrKS+mi9GeSlw7bgAAGNHuP7id5p6tXNCVriv
	 3epY8bRYRpYPvYx3Gg9ToDVp1TJO2nq71pO1a7SZWX0EvlUR/uAyxswoSCUfnialC3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585228;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b3Cm1q20K4DieQnvgy8MfXKhI41OP/cMkudVxMrxBw4=;
	b=XHz0jx2bitfOqsqIWvIavySvWX4hB/oCpAVCaj5p1qOgJVtRkzmulT/2j+xB8IQLadzv
	 xyN9GLc4Lpl74VISHWoHZUeMYrORKCf/JwvMe7AVmJklAwEbNA7JUx8cOIZvYG4eCuHvH
	 6BOka6y6+hxKOsxkT+7nqfcvSAKFI9seDUdHNbZMLO8IzNG00A1wDEp2q2KyMdgk85zRq
	 i8fKzfw0tvUKFCRBj27mQO0hURgIRKOwB6F7T0XeCm6r0Jj8zoHJYbENQx/3TdOFyYV5n
	 I6qXtkj/MxSXC73RAQTThO4qFoiMzOkhHLeNPLmaW6wfVIuAcQn+5YqLXhXfXghanFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvHG7PKd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81E606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvHG7PKd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1605C1F000C4;
	Wed, 21 Oct 2026 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585228;
	bh=b3Cm1q20K4DieQnvgy8MfXKhI41OP/cMkudVxMrxBw4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=SvHG7PKd+aHXw88KiB96bnHtnNO53T3NCOxlwT/FLjTboMX9gyyfqKcU1JMfY4j0H
	 3uhEJ/EaMQ2yROdYGvGLYGmRJUX0txVfwmhglCz12uduqgtsq13yt5jffjnXOgHHRh
	 /dSOaAclqwOcIfEx9WBCZWpbCLiDMqU0+WT0epvG9uopfGzYltwIchS0c8JOYg5K3f
	 vHXd0JOzVn4NtG/TzeGsrWXpnMUX8SFZkO9att8IdxH3+h9JKypG+fa+jwyheqw2Bb
	 HjjEZp3yFtTFYaCjVsio/kUL6RxePajpMTDD4geLAMFxdYYnmjP20ZhcU0TSYXGLLg
	 NkRuLu7gJ0PkQ==
Message-ID: <sashiko-outbox-180224@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/28] mfd: intel-lpss: Remove registered MFD child
 devices on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-11-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-11-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:20:27 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> When intel_lpss_has_idma() is true, intel_lpss_probe() registers the
> iDMA64 child device via mfd_add_devices() before registering the host
> controller cell.  If the second mfd_add_devices() call fails, the
> err_remove_ltr error path returns without calling mfd_remove_devices(),
> leaving the iDMA64 child device registered after the parent's
> device-managed resources are freed.
>=20
> Call mfd_remove_devices() on the probe error path to clean up any
> previously registered MFD child devices, matching intel_lpss_remove().
>=20
> Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS device=
s")
> Closes: https://sashiko.dev/#/bug/linux-b0ba1dea-0272-491a-a1aa-2fd27c5eb=
9b0
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D11

