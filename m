Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44A37EFE6;
	Fri, 10 Jul 2026 19:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711858; cv=none; b=IHJMSeI0VaOhNCKcjW+7hIwBbiL/gtsEbuQHQqfIZ83LIIs4E7i9tzRgwvhaKD6manGepMsbp0ckESypN6r2EjPqlPnltVbL3/GJmvyl4Y0063IXg23sNAoDQfWiSqsVLO1q/dyFNKXI11qpw45e8GqdHE9UqFceVmHVFxAm7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711858; c=relaxed/simple;
	bh=c8oheqlH0eb/TTGfWmOZgw9NJmh42cr/7Bm44vzz82c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fHaqMTr0B5o1/KMlzooprAT/npmNFVQ6XPbRMjg/8TKB35m/kLZqJ+n7wMsWwuGjsejlo4FpP4jLkJ9wvMpUZjVFQ3lxyqKnCTkxS75/xgRe0ZqsK0ofNAzxtrg+I5QhlyYoq8yVQFHiU+XgnpcOGZh2IXNw4RF/eXJannkQrEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+cj1EO6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+cj1EO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC191F000E9;
	Fri, 10 Jul 2026 19:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783711857;
	bh=c8oheqlH0eb/TTGfWmOZgw9NJmh42cr/7Bm44vzz82c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+cj1EO6dzr9k4cXTgxBqenoRHq/xj6GJ0805aBKzC30iTm6AS2sxgmd4flSE90GX
	 VMyQ/GPnQ/yo7pv9Fl4Ku18phjF3953dGJxMmvS/aTAGvkqjn5QStGD2iOlvQ7ZNjz
	 iO59L7RdXDs033tBOpOqp/qDgdIKVhhClcs113Nj3z3uhoh2JWXdG7bBminc9fcP+z
	 J+bloOMGOsUdhWemzqRJZwVyL5wfto0GhLDt/QFy6u3JH5J9YbJt5c15w6LbMRR3hZ
	 DkfT+c7/3EGdPafLLBU8KBNhwhKevSYqmk+7f8tiXeG11O4kNzzGpn1K7z1/k1K9Z5
	 gTsPOOdnZ4z9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Hawi
 and Maili SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
References: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 19:30:56 +0000
Message-Id: <20260710193056.DDC191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document Top Control and Status Register (TCSR) controller for
> Qualcomm Hawi and Maili SoCs.
>=20
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710192737.1689=
453-1-mukesh.ojha@oss.qualcomm.com?part=3D1

