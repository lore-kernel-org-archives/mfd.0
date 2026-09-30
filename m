Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505384CDA2E;
	Wed, 30 Sep 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772717; cv=none; b=MjrIgFtBUR9qF4xk9oLvhQExjx3Zmr21ckvgdO3utYfUJOCdd6RaTIO5/bP5niByLLDcJIkFIM9e6g0jybd5ThJ+RLiZrs7VRRWqK3kn3tboT4aa0fSuHBTxvglSiDX/jS9V5uJmgSqegtb78EfbXgaLSo/VZ5SxfhQxfIlA0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772717; c=relaxed/simple;
	bh=VvPoCnlkRp6A7uxpzAzZyuRBzQMeTQb4Bvm0ZNYJdf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O5c4v1s/hPUNKCElQKe9knUbEfm1tHZFHU+4b82v9Obute9qx+b8AO4qep95pP2RphqX/eKgUA6rG6HNECR+DyS7jKzYjo3WTsQuOmrdFO9rBhhl1M1HOdh8uOqfaJ+9e+ySrpr9Lk2gXeiH8Jwjq4VnY+C0Aev9/ajDVCb3y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ko4YIGlw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ko4YIGlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF941F00899;
	Wed, 30 Sep 2026 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790772700;
	bh=VvPoCnlkRp6A7uxpzAzZyuRBzQMeTQb4Bvm0ZNYJdf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ko4YIGlwPgPZ97HnPhM4WAya7mnwNrLvRAYJ+Y2dhZqrdcjtQI+gi0o4qOr2PcaDM
	 QquGUiNriN7GUhGBf9hKjV4+ksKrjRBXd5fO9ffmDNXkNjsW2OhQFYruGtaRQbI92I
	 eosMta/wExaKFpkaHAJIWFx7CYMgWck8JiBucI7uW/ECpZ5884johSeZIzY4FPwZqh
	 nLZNoCGQSxfbl+vIp/9MSlhgRWwMEIk3ePUMwk6ZjizDUrOtUsndsy/PYkpmU5RxKS
	 KZ/8MyFqnU2uD3h/0T0v8MPSPDhTK3NVwDeXAhe1kVDF5ar6KcpsTVtSbn58BGkI+/
	 VfuVV9v3HeE0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: qcom,spmi-pmic: add
 compatibles for pm4125-codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 12:51:39 +0000
Message-Id: <20260930125140.3EF941F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: commit message description is not capitalized
--

commit 0fe10ec995802f796e4bfb33e8867d9a4a028323
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec

This commit adds the missing qcom,pm4125-codec compatible to the audio-codec
node properties in the qcom,spmi-pmic schema to complete support for the
PM4125 PMIC.

> dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec

[Severity: Low]
This isn't a bug, but does this violate the MFD subsystem commit message
formatting guidelines? The description after the prefix should be
capitalized, but "add" uses a lowercase "a".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930124607.1109=
167-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
