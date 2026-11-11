Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428465;
	b=l4Z81rOaadJvPyHDpL/3x3EYfjc/9zOBpUxaXrgZE/iWvMbEHOyInYBD6N33dLDYZrez
	 OPrdOSP/AGoTLXOJUKkuHUl0TFoEywJ3pY/RcXfqbbH02geW9el1pXTpePPj6l268fiA/
	 m9jQy6gH6oLWPrGkA04/dcypEvi90gMX5XWmQBBXaxhRWFquGg3+vJknBVsDdDv2vPklC
	 uWBPc+Ot83PqoiFh3n2jAawvQ/0yCR0VmbyO4CCnh1+jqe1949hR3lZ0S3uHDgLEP3dWx
	 e+twrR7Iv1do0dF9DB218rd3DNnd+PZzzfQH7S0pzMxnxpkRCdd/A75LIIZzJkA1Xbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428465;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dlOnV5eucMYFGkrEFbrHj7aS4Mymbb6BbNE+p5nppn8=;
	b=IrkgSoiMiYTjt52misj5hIGBsD3xioe+hjR+vudhlgO2/yVOHf68qOWQ4aOt1bMDAvzz
	 z5ewSpd1foJQMl3EV5t3wwwdPSEoFIQGvzC+Zr2INPuvi0KNM1+Wo0E4QrhiVv6emJWIb
	 NbCO0WHP9Sev8Rq+dix/NVQ0Rh5QAfROB1OXKyHci3ToVVtb++FUN9c5/kL+x7zhbtEqH
	 FqTLlpEBZa7dkxyDFVZL/NButR7lVipZL7g+2CLRtH/kTlp7fwZIISDCemPqhNXJwE4Zo
	 XZwB21hmFFTkUntfhKjehQ6GX+sTfDg5/6EbgP5L3Yej3DOrDLYsuQXxDecvCOCZD3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bFu+zW+j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29988606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bFu+zW+j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DC51F00A06;
	Wed, 11 Nov 2026 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428464;
	bh=dlOnV5eucMYFGkrEFbrHj7aS4Mymbb6BbNE+p5nppn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFu+zW+jfj0wh8+RWFzSYsTynQOENIqBjy+/Kpd2AU3MwjR/6bW80+7FBkbp1HWF2
	 H6xa43gzKViYqvWqiIChsy8mumhWUwWBBJk7joWuzT5py9nhhQgQUQkVIktwVl3T1S
	 IldxgiPPODkFYn264VO140dxQLET1v1uNY2qr4rWD2sHKgI88cY5KBMWA4T4xnDHHK
	 sc/yVXyO9bJBbKLO7wk6NtswdsrbTfkt6hUW4LU8S15GKAGd1++JAtUFf9sTdfdx9M
	 idsggG9XrnNjoOYSVSzIguSoPkMomOuQBOd8z6VWIaCdWMpUmqzEBjyodeidS6q24J
	 iv6AQ5QOqHQGA==
Message-ID: <sashiko-outbox-209635@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: mfd: syscon: Add HiSilicon register
 bank compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-1-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-1-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:21:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Several HiSilicon syscon blocks are missing specific compatibles. Add
> compatibles for the Hi6220 media NOC ADE, HIP06/HIP07 SerDes control,
> and HIP07 DSA CPLD register banks accessed through syscon references.
> The names are based on the label names in the .dts files.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D1

