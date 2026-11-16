Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812532;
	b=CjK4dfB/xtyQm2mWqVGFPDdMkZZ6ATJhBceZuUM6aPjAl2rb20eCX8/ZTbEK7IsUJ5IT
	 PkQdc003eI87P4aAky4GV83bCL2wwP3GZcjfQWCpWEOdhd1LzownKTFzGhkxyxpnKB2aE
	 zOwO1sTrd5xNwnV71MRDGhjh+vLQtBHa6V5jLloUuhN58VqpzsGZj82AW+sSVJIPUQ4m/
	 XmRzXOL8X1LsGL5dwDfcWKprB8m/3zZ/npybWA6dGYcz29eUjuEEv7DHuTge27lZQGa3J
	 ZNbDNvMM/6BNz/GH+AzaLqYR1OfHy8aggyXfQWyLyMhnxLswlI5LlPTqoI6km+GJfAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812532;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ddCkCItutF8W7wd78GmvHpg6c1fDnsgeulvOTe8G6XA=;
	b=kXXSIjBNGox04kxpmUN1xqaEoU9gyCqitE7cZlCNyYA2+eT27vJXNj0RFGBG3KY+wLaE
	 1P24MtoyFmeM2aRy17Dp6YGHJlJWuA0dWwMS+ls3NSahYzZIX3GHi8z1a4zJWg50yX7to
	 1sJU39c0FWey5XU9K+0QzbxgFJbHTy4WIuAHxOCbGi2TpG8LwL16uDPmGEtNW3b51YTkb
	 2NBcMgst4sEzWgZnSHIwrDSZ3HsWBpY8f2zKkb4Zqxe2JZU+rzyrkpOkiQicf/DwQgZG/
	 PmhOU5Ts2sIRZLDgx+kioXrbnEIrGaIPYniMIgN07Ktf4OL4lf9z4dKfqBITb2U66cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5n83EuN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC9606A33A
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5n83EuN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844EC1F000C6;
	Mon, 16 Nov 2026 07:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794812531;
	bh=ddCkCItutF8W7wd78GmvHpg6c1fDnsgeulvOTe8G6XA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R5n83EuN3ytxyV5pt0r7ZTvwkMavt+WfksN2ptamT7rlyhr2RYdkr/sXf6J1yFNYd
	 OKPhPkfXbVLmuN/b4U4McqZ8fJyupah245EY5evOjbWYbum1RmPidAqHk44AY90bg2
	 Lqride7Wwl0zSuQx+jpr0ymXmojI9oVEhgTiMNaQBET8TJa8D77kXu3m0LR5E/wUyq
	 xW7w0ZQqt7Da01iyAHo0ZvK4qXvaCjjM1QwXCh5bJxAy0udNf0s42Ptc5vsXrYnAvV
	 RZpHnmtD1Js6nte9P7imzzPc8NFJ8heW2x6XyiSfqDONTL4HxnbbUn9UvJbJvTfB2y
	 dL1KDEnZp63Ew==
Message-ID: <sashiko-outbox-216362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: mfd: pm8008: Make interrupts
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116-pm8010_i2c_support-v5-6-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-6-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:02:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some designs integrate the PMIC with the interrupt pin left
> unconnected, deliberately. That of course compromises some
> functionality, but the core function of programming the voltage
> regulators remains there.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pm8010_i2c=
_support-v5-0-5626ba17c0fb@oss.qualcomm.com?part=3D6

