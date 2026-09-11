Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA96A470445
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116678; cv=none; b=cKtjmYQfJf6Obo8TRZHIUXcxVf8ZFbOk8ptP6fi5Oy0uuXg+fE/hIj5HYcf8CNC1+fEgwxKby8+KDVMQtqiVxyjkNYzHy4YzZG3lyaU00+77E713h4un8aRO1eEwKuyuvJlcPPvAlie/QvS0QDUK/6px99MT16GRe1Rab/b7IKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116678; c=relaxed/simple;
	bh=tvMysC/CeuoJ/SvvYgRXc3PRiPBy5Wp9M/28y1+/T4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID; b=sCYtY1gWI7vHIAWQCh/XQRQ3T1MkYPftqsQEfK5GMbc5XRfxL5qtiuaiJO0WiUPa24o7mPsKR1jDDFfhQsdVBqJigqNUQD+uv1h6+JHqR9Ohn4SPmr/xuR1qWzNS5oIMAdqKigVJdo1Bj9Yt1H/rf1u5BipRPsKVpq+mLV/N8E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmoMB9Ip; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmoMB9Ip"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so3643765ad.1
        for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116676; x=1789721476; darn=lists.linux.dev;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwetnbBbHmq54+9PKFJhG/LjURf4GtsJuxXdoTuoU6c=;
        b=kmoMB9IpdMzYcbBirkrhL5HvlwJgf/DEqONJ0VIgnyeDdKANtoICYMaQsHPHDPl7ka
         aprROkzlRVWaonHbbk9qr/ypNNxo2KfYpgIDbXaw078NusnyFut7mXh8kAvfxj9xOflZ
         cppwTsdtQFNawFbNlN4VPTVSmYMy7nGEEEsgKebl2h986trCMrUuVYySAUdhf6Ee6S1w
         7lhz/GLrEWZrrPE100NmbowhgW5cW7XoH6ykmU28F3iUykLzK0wS7Sf+CZT4N1IqiWn3
         Wgp0yBlaHgjuBfAx2dMuS4aeMuCEfEuaUeg9e9YdiNPnrgG2TAC+kItdxjQ/dC8Hx/Ds
         W7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116676; x=1789721476;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AwetnbBbHmq54+9PKFJhG/LjURf4GtsJuxXdoTuoU6c=;
        b=WL3nkixirrhCA3y3crgmBE55XP+RDx4B0VJc4W7FO2g/OuOsWn64+RZUPc5s+YZjcH
         hVc2FHDQb358pBaWcYpQ4fRMSp/ZLZ/PI+2FsUvh0HdooJK+m6NsgIYCu7FJPwr6io8x
         i/hDEdEw7tl0kkeutaipTQfztVEjSG/gN8eeIHEbU73vAwWnRcvY9wuG7BAjQiiEbXzF
         oPzlKz/VO714LA7SK3zumKhvNsPZvBbnO2GF3QEjPfiqfE5kZTLDrJA0EEAeyntzRcMd
         TytZ279tCVmsdh+ZygESowA/y5vgGPUpHYKC4N2M3q8UF6A7JDyv00XZKJn9ymlPruZq
         zslg==
X-Forwarded-Encrypted: i=1; AKwUvBzRHPaNt9yNpd3wq9kJdl/O+d/+Ij7O8/Kh2fXjos28KJoTSdhgEv1nI8hO0PhGojpDfLs=@lists.linux.dev
X-Gm-Message-State: AFuF++nBj5wlo37m5pkHwRQIY/sg41z7CDfhduIiALkiEFByQDW9Xqo6
	zCQ0ph+nCNuuQNBhasaz0UjlpPiaXGnycB+JHEcYaNn/eUfApgw3wAeC
X-Gm-Gg: AYBFou3iBhRfB98lKbEUynU9uiD8VCjxs4bB+PmEJCtC7u1BzJ9XC2JVVCHH1iFio02
	Zve5Y1wVpu6pOMa6mypRKgndkbpoCGqsIz9LcZ0gg0xYGV6Gvn3TNDchws5mkK1mH/iAvJ7P41v
	emlxCavSHrhbtAHHgkyZCfxUr2Fs8oTGTJcC2YQu9KFdLnYsMIVkgJ3EeGRXPRaQcr8FkFZlOLH
	iHyBIfHEqL6bGRTSE24tn4EES0E0vYUrTCTFgSnAnRsH67F/h7l6C1kYL3AoehoYd4tKaor9BbF
	+4mi8ffovrKdtSBGg6/hfNpJOXPn39XfAYCV+F+qppNPmP4XVgkybYrVP4a86zYLALm/FbJtsle
	EY+XYIyMpGjHGadCEcF6SuPpSk/2/cj6dACRf/6e4SxO9s+KYQ4EAxG4IYYwmWPAE6mSGLpbA6k
	etWI9YDQQ+HkCwUFN9PHh/PVOC2doK6h1mbv/tvi0vMIVfrxjyp84WlAynpKXIDLl0q1hb5WugC
	ckyFIMb8gfXAaZDu6sFlwqyDo/PlZCLT6X4
X-Received: by 2002:a17:90b:270e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d9c1fe880mr5993873a91.17.1789116675878;
        Fri, 11 Sep 2026 01:51:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm4799895c88.13.2026.09.11.01.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:51:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Botsz HUANG <huang.botsz@gmail.com>, Nick Huang <sef1548@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
In-Reply-To: <20260910094326.GP2133376@google.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
 <20260909161454.GF2133376@google.com>
 <20260909161710.GG2133376@google.com>
 <a05c4086-1681-44f4-88c6-de1073b0f5a6@kernel.org>
 <20260910094326.GP2133376@google.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 11 Sep 2026 14:21:10 +0530
Message-ID: <178911667044.715443.13795127169435157424@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

On Thu, 10 Sep 2026, Lee Jones wrote:
> > Now, whether they should be Acked-by:ing patches is another issue
> > entirely!

I am the one who carried those two tags into v3, so let me take that part
off your hands.

I collected them the way b4 does, without knowing anything about either
person beyond the mail on the list, and I am in no position to vouch for
them.  I should not have respun the patch just to add them, which is what
v3 says it is for.

If it is useful I will send a v4 with both Acked-by trailers dropped,
keeping only Matti's Reviewed-by, which he gave after asking for the
"wainting" fix that v3 includes.  That way the patch does not depend on
how the wider question is settled.  Say the word and I will send it; or
if you would rather just apply v3 and strip the two trailers at commit
time, that works too and saves a round trip.

I will also drop the Assisted-by trailer naming the model while I am at
it, as has been asked of me elsewhere.

Thanks,
Hemanth

