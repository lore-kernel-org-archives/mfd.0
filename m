Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC9D3655FA;
	Sat, 26 Sep 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426743; cv=none; b=iRtGtYRbrvaeEh9vCMm5gzLDqimuSu7ZghQCFB2DI5smXw/Nmxg4AT1E6vO6PCaRVtB/WVN+yIfk/05dzF0YEKvefQIhcIhjQeCHYPfgpSmgcw6F1xto4sd+ysooF9UAytiKkJZmre9ozGTt+nOTQwIOOBrjRWIH3YrPaScM7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426743; c=relaxed/simple;
	bh=rrOVAX/J5+TJvSEyvqDfTWpr8TT/NvPdLhYpf/kDIao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uufd2bp22lehhNuMSGz7WYMuJjnCWhHdbDoEhvQWkKeMQzqMmFdk8UB61oETXg3o58TEF8WguukcXZLxFl72Cl1H76BUb0Lo8UqAdeiI8I0KZIn370Po0trBHylKRB+l2nqnvpSQOTPmXweWZn/ybH7WGCuosz7j4dHQ7e6qQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKkMjBfx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKkMjBfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F251F00893;
	Sat, 26 Sep 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426741;
	bh=rrOVAX/J5+TJvSEyvqDfTWpr8TT/NvPdLhYpf/kDIao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JKkMjBfxufi89JfqtkT5QY7aOnV2kZsdflhOTxiGpfgxGUrQNjvUdCDFXnC/WcYaM
	 FxigU9fOVKkxjXFatlzLBOPF5hxrIEuXPWc8cz5ayvXrWlCgM3zHjxQjwDl+m1h1qm
	 Bk+WbzQNB/XyfLC9GqjSfyp8a3Ui4jMvsZQc9DgF22fR+NelFuqHmktWAI+kABnyXA
	 5R7WcI68zd80ry0nhiydT6QX7yVeYw5+sSF24jvM5sRquV/y8Hgdg6sifOdcuXch3l
	 yHRt3vQNVx6F5Im0eiiwLqzzigicyacVL1NKQWpWH7XGtKak5XwqXqym9+5cCr5bYR
	 DqdPbzlRK0jXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 04/12] usb: typec: qcom: Make PMIC port probe
 selectable
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:45:40 +0000
Message-Id: <20260926124541.34F251F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> This is a preparation for extending the support with 1st generation
> Type-C.
>=20
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D4

