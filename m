Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794320503;
	b=PYuaSmk5sAWxNk9BtjWZgoRAZnekimKsixN6MXSjpRGWA2gxiUU2rN8KHVMDWd6dyyvc
	 qlR78u7Arm6aEDYsHzUU8TZBnGnflMbUBdzRnuQsCVL59zEjMTy6ymviSxN/VlyYv/cCJ
	 5HQHFoSvfROM+MFkCu9Apd5iabvHJfnRxZtn7mKwz4vZWc0+mUwmS2LJx4+TrI3Iw3Faj
	 gmct4dvJgTs99fBTcwCP3GbYTlHT+x4QHdKw5+0MZFp51l7U7UtKq1LhqQwJPBlFd+TFg
	 koRxVz+YLbeKtejGAAZgOpjWjt/IXdoh/m1of1XGYuJybKBBYDMI4zmwDkVs9beCHfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ejm8pe9G15DYxQ7Hb5OdNIp8qY5r8fdDKVN+ZYBfwxM=;
	b=DS20UYVFCNeUIH0SJ+PDLTJiLkNL+zzTjRJGuHDKnFKsL8DZqmPul+D0z6C18x1pIfjt
	 7/3o/GocEZsHOkrdLmvM6n1MOGI+k3zcB8/yZaSRpeDxW8bu8Pgx+S+LudzVnhaNBnVq9
	 moa8pTS5+WOAc4P/mKfFFEK3UhkQLM/zN+xM7VaWQf4pdqCKmnw4EfIgI9Bt6aI9MkQST
	 CRTou2lUmGZpdZABcrrQd7FSEby8xrgSeEeMvP1CSWrsJ8I78oGNzvYC4DKdBcGqJWczG
	 FoQ4BdsTBQGfO88/kTuiq6TyM8TGApGZFLM0cuVUfSlBbELgth5RToxoKE0GCP4T3Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbcy8jjd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC346606A331
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 14:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC346606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbcy8jjd
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c15956ce07so458208e87.0
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 06:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794320501; cv=none;
        d=google.com; s=arc-20260327;
        b=P7lo5kRXklUi0ooW84LToW01P2QpRuMuuos4ofbOJGXp56FAHgvbY3S6KaEzcAl01h
         RYFd/7XTiEUdDDdXvpkioorIYABxbkiljQVVzr1Wwzbg5JiM2+M8/nZcf5tbfiafYubl
         ArPABivvDXtYay0iNsJUEd9ST6nRMcxy2PLshfM76O0pu+VFLpVj78bVjMvDvCY9YaEy
         y8HbHwxeaOhkIUq0rI6H9GuDEVXjvNSPyv4JDv7rdFved/EUh/n4Lv3f4GFnnkDYQqIF
         LvnwGGskJH3AvnD2p38dtQYJ99RF5SsXazaRbWSOHfn1eXauuZvZ6Ipmfohk+MvsRnBh
         jYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ejm8pe9G15DYxQ7Hb5OdNIp8qY5r8fdDKVN+ZYBfwxM=;
        fh=+iQEYyfyJh3skSr/eMPvMW65m543ODe6nxFC7P74HCM=;
        b=bh6Qo0tAeDs6rqoLg6YzjNwEtd7ROs0XNZIXwhoefGp23gEMQgn9mpKaz8tcx3iMAf
         8oTwTAohWeFjufsColnQ12q8wahaGNdoBytR0v7SScOxfy9UXVU86gS1h7FB3UOJU5ln
         KAiCg3klWD8EWCZmZnyT8708asCTtcOHHb96mIUu0D9+pbWTiqgYny96sTTol3B8HR7q
         Ew+o+f6O/WriBM3XS01Lg/YFLzbWBUX/nXadRwAPrgD67jHfqcRLQWz/gTcVyXzf/P5x
         7zFw9JWH2FbPihZDg12s3DcC/HBhy8vhhFcR7XNnfBqeBfFftwLC+jrBOmnbxAtdOAZ/
         uZWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320501; x=1794925301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ejm8pe9G15DYxQ7Hb5OdNIp8qY5r8fdDKVN+ZYBfwxM=;
        b=wbcy8jjd0pfCBqX4rpiw7UWNmkezQVz0sKtn5XRj0nKXTn0hluRwq+mAicQ/c+xaw/
         SURRbxDr2p+Q3qANbfA7PIPu1hNcFF/9hts/nl8BvcTov4xEHqMbG3fOGTQ67RED4xWa
         eJTNSlzzD1RD4BQVoH5ofVcuMttbr17FmbllO2lHzZpU1iuH0GZFhuLmharwFRZ1hOW+
         M6fzu3Rw1sAbbSZ2aiQTY87GupNlhCJjJ5H3WhxIuIvdsoBZL2I29yQhSkgZxs49ibD1
         AstSXc1hXGXA4nvOd76qLXUVYDUO6rl7CTrwLAJCA9ObN9zJMgK4DR56O2+6Ba2fHrHx
         wS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320501; x=1794925301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ejm8pe9G15DYxQ7Hb5OdNIp8qY5r8fdDKVN+ZYBfwxM=;
        b=TJUCUB52Xm2Sy1IdZf6ax9wGvEDwq8O68XbpqbiGyNq3P7r5i5JbycOQTl4cVhwPma
         gxcgZR7lFuXKridh/+DYO9BrLUC621/fBlpoY6OuJdGHh4mE2jz8Lx7blINRRZJZv7ZP
         6LaHmANgLmbZPjXq2Z+Kktl+ozS9HeAyQVQF89naBRzWWB+zIxkPM3UUMvYHLXQIlLfm
         oqKy4k+g1OFlheNwf/e4QfgRZPnwqSlU/P1+EjAQ2cOV99qD8yap79lqhVrgf1NffJ8g
         pZqNlqWZenHKGmmPzf1OnE9YE/gn90CnskvohCI4JCS9Jh4cPs+L3bHmf+skSMguMFSw
         OCMA==
X-Forwarded-Encrypted: i=1; AL+hErEnmK6nUtEY8fbKhm+4RUxYr1XGWRlh9NDBcDuGKb3hfb2sMEBa+NLI2C0XNrx/gzlDUjU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9BJaUj+gd2YxcEYwEST9PCsgnlFyy6lJP+bA3XkALvDzt1zjVS
	dCZGf8VjFYrheLj++/4ML2f+HKdIPUyq0noCL4rUDSrEXI2JHWqG4p6c7NP/QVbvZS3LqMEIFdL
	qjHMUJsmVeIaSI/Yq8l6cq5ero54BWdE=
X-Gm-Gg: AYBFou2sPr8LzTAv6ZO9eED8JNUuWoHu8PeLi5xfDv0omLp5n/lLVZjqSVhJpZCbciO
	zvPr4HEzofrR1jKmQNIQ8UCxfLMVISTCUfv8HunVic4Mh/KUADomuyZI6En3AgWIeXKNlFwLzJr
	R52NGv1z4TDk0aZYZwP2qd4RiW6VYsxhjQAtYqA3EVZEHmP5jho+dxcsLLhixeVjcrHsvZa59tn
	htwedbsWgpY6N0xq4Xj0iHbwNpJ+mm1OcEm0ITtQYHx4J2M+jXqnSVM+9lknkJt2cWu2n2bRJ3u
	YIQSMoj3rgeBIDn9bgB+Y6tZGiXvT48obdA7Fe0TI119arVSADNyqvy8me5sYD060EKJk3RLvQm
	C5jrV+njdzi/hSuGArDU71nfuBSQFSd6wrvroXdqYaq1zCp0zsT7mWy1DkMFzJ7YFvFdaCbbIYd
	OiN/2ENCxfs0AmfknMS/AAbZmi5g==
X-Received: by 2002:a05:6512:15a8:b0:5c1:4bb3:afbc with SMTP id
 2adb3069b0e04-5c156de82b9mr828897e87.26.1794320500715; Tue, 10 Nov 2026
 06:21:40 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018022400.599028-1-festevam@gmail.com> <20261104105829.GI792264@google.com>
In-Reply-To: <20261104105829.GI792264@google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 11:21:25 -0300
X-Gm-Features: AclHuK-TGMXiiM572Q7C7MqR_s9Ybhyu13xf-9p15OjOQAwSBPcq2XTBncA1S4E
Message-ID: <CAOMZO5AjeeNdeysBuoUoejg0yECiNWjX6o=Q+_iPUfF4=uiVOQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: mxs-lradc: Pass mapped IRQs to child devices
To: Lee Jones <lee@kernel.org>
Cc: dmitry.torokhov@gmail.com, jic23@kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-iio@vger.kernel.org, stable@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Wed, Nov 4, 2026 at 7:58=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:

> If this all seems like too much, let me know and I'll spin-up an RFC for
> you to test.

Thanks for your help. I sent a v2 with your suggestions.
