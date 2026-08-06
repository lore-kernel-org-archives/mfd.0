Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9258F2E762C;
	Thu,  6 Aug 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021694; cv=none; b=NfwDx/TLzaX1QKcgPSDL8vfb3xHtd8DCoL5uv9uiD4Z5MpUPQ7PfJGIRIko2JZ1k7LOYSCL+HboK0FRswZSQ5DNmx7ooq6tNzsR7+kYw9GzdDkNstO32tL7Wk4rVXJLF2OWbqd1MXjiz1EsXoDrQPBf5GkhoUi0NX10hBrlBMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021694; c=relaxed/simple;
	bh=B3oAITcSaU8Y+aCPp8ScB7y6y8+R4ZitKu5iiAq0ABI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ofyY+igMqE5V4wp43e94AtuF50vR+3ToARim4R2qzKCeUneQClf0GeUMbsCo8LkTV6IwKBIQSqV5PBbU72ZkCRY+gn57EH758yJ1T2K5A7nwYSjRmnLhEPSSsG2iFmJJsa01W8V/SeCqapgtpA3V7luEyXmEz+g3o+b/+aJz1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tne2M+Yn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tne2M+Yn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786021F000E9;
	Thu,  6 Aug 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021693;
	bh=6OugKpWM8mUHbM0WTe1CPPxT6TsCjghrpa9lmfk1GPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Tne2M+YnZWw6dAnlukcvB/2eEWVnirS0J/pEjVuRy3ZDdSGhJ+MRJMSJWFC6ZNwsH
	 tCOIRYStieaJK4m0urzMbV2gT/ag4YIDBD7CDqI2g2cgRjMtt0t0cvRxlaFEM2GYLm
	 n6ibMoZgUJZL+w2OQ/YnLdzSPPMnL/xGu8978eD/t9pZQXGp8gcU4bHjZu69wQM7Rn
	 RLVAewGltlPpSomMhYbK7KH6W0RK0RTKriwBoYz6FOMZqJ0Dd/0dnUVBZzk6EnBXI0
	 P7QbTsLr7XSF3GnyFOpVm6NlF09wTYRvDpiaTbHs0NaxZHmiHmgolNlzkolofMmTwH
	 z3n3cP+53PZNA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260720115523.99956-1-pengpeng@iscas.ac.cn>
References: <20260720115523.99956-1-pengpeng@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2] mfd: rave-sp: validate received frame
 payload lengths
Message-Id: <178602169221.2909629.17537118862153128816.b4-ty@b4>
Date: Thu, 06 Aug 2026 14:08:12 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 20 Jul 2026 19:55:23 +0800, Pengpeng Hou wrote:
> A received RAVE-SP frame contains protocol data followed by a
> variant-specific one- or two-byte checksum. rave_sp_receive_frame() derives
> a checksum pointer before proving that the frame contains the checksum,
> then passes the checksum-inclusive length to handlers that index the
> command, acknowledgment ID and event-data bytes or derive a reply payload
> length.
> 
> [...]

Applied, thanks!

[1/1] mfd: rave-sp: validate received frame payload lengths
      commit: 0be718b5451bd83865d6e2a8d750ca7886c4772a

--
Lee Jones [李琼斯]

